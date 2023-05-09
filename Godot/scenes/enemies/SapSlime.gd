extends KinematicBody2D

signal got_hit

var entity_type = Globals.ET.SAP_SLIME

var pHitBox = preload("res://scenes/building blocks/Hitbox.tscn")

var PS = Globals.SS_PS
var AT = Globals.SS_AT
var AG = Globals.AG
var HG = Globals.HG

var attack_data: EnemiesVariables.SapSlimeAttackData = EnemiesVariables.sap_slime_attack_data

var prev_prev_state:int = 0
var prev_state:int = 0
var state:int = PS.IDLE
var state_timer:int = 0
var hittable_hitpause_mult:float = 1
var histun_time := 0

var can_move := true
export var speed := 100.0
export var can_accelerate := true
export var acceleration := 35.0
export var friction := 25.0

var attack:int = 0
var window:int = 0
var window_timer:int = 0

var velocity := Vector2.ZERO
var dir_input := Vector2.ZERO
var dir_facing := Vector2.DOWN

var hitstop:int = 0
var hitstop_full:int = 0
var hitstun_time:int = 0

var can_attack:bool = true
var attack_pressed:bool = false
var attack_counter = 0
var attack_down:bool = false

var lunge_dist := 50.0
var detection_dist := 300.0

onready var sprite = $Sprite
onready var hitbox_parent = $HitboxParent
onready var lunge_player:AudioStreamPlayer2D = $LungePlayer
onready var lunge_sounds_ogg:Array = [preload("res://assets/sounds/player/step1.ogg"), 
									preload("res://assets/sounds/player/step2.ogg"), 
									preload("res://assets/sounds/player/step3.ogg")]

var idle_anim_speed := .1
var run_anim_speed := .2

func _physics_process(delta: float) -> void:
	_friction(delta)
	ai_update()
	
	if(dir_input != Vector2.ZERO):
		
		var angle = round(rad2deg(dir_input.angle()))
		if(angle >= 45.0 and angle <= 135.0):
			dir_facing = Vector2.DOWN
		elif(angle <= -45.0 and angle >= -135.0):
			dir_facing = Vector2.UP
		elif(abs(angle) <= 45.0):
			dir_facing = Vector2.RIGHT
		else:
			dir_facing = Vector2.LEFT
	state_update()
	animation()
	#print(velocity)
	velocity = move_and_slide(velocity)
	
func move():
	velocity = dir_input * speed

func ai_update():
	var scene_tree := get_tree()
	var player_id:KinematicBody2D
	
	attack_pressed = attack_counter > 0
	attack_counter -= 1
	
	if scene_tree.has_group("player"):
		player_id = scene_tree.get_nodes_in_group("player")[0]
	
	if player_id:
		var dist := player_id.global_position.distance_to(global_position)
		if dist < detection_dist:
			var angle = get_angle_to(player_id.global_position)
			dir_input = Vector2(cos(angle), sin(angle))
		if dist < lunge_dist:
			attack_counter = 7
			attack_pressed = true

func _friction(delta) -> void:
	if can_accelerate and !hitstop:
		var _fric = friction
		if(state == PS.ATTACK and get_window_value(attack, window, AG.WINDOW_HAS_CUSTOM_FRICTION)):
			_fric *= get_window_value(attack, window, AG.WINDOW_CUSTOM_FRICTION)
		velocity = velocity.move_toward(Vector2.ZERO, _fric)


func set_state(new_state: int):
	prev_prev_state = prev_state
	prev_state = state
	state = new_state
	state_timer = 0

	match new_state:
		PS.HIT:
			pass
		_:
			pass
	
func set_attack(new_attack: int):
	attack = new_attack
	window = 1
	window_timer = 0
	
	window_speed()
	
	set_state(PS.ATTACK)
	
func state_update():
	if !hitstop:
		state_timer += 1
	
	if state == PS.ATTACK:
		can_attack = false
		can_move = false
		
	if state == PS.IDLE:
		can_attack = true
		if(dir_input != Vector2.ZERO):
			set_state(PS.WALK)
		
	if state == PS.WALK:
		can_attack = true
		if(dir_input == Vector2.ZERO):
			set_state(PS.IDLE)
		can_move = true
	
	if state == PS.HIT:
		can_attack = false
		if(state_timer >= hitstun_time):
			set_state(PS.IDLE)
		can_move = false
	
	if(can_move):
		move()
	
	if(can_attack):
		if(attack_pressed):
			attack_counter = 0
			set_attack(AT.LUNGE)
			
	if state == PS.ATTACK:
		attack_update()

func attack_update():
	if !hitstop:
		window_timer += 1
		
	match attack:
		AT.LUNGE:
			if(window == 2 and window_timer == 1):
				lunge_player.stream = lunge_sounds_ogg[randi() % 3]
				lunge_player.play()
			pass
		_:
			pass
	
	var length := get_window_value(attack, window, AG.WINDOW_LENGTH)
	if(window_timer >= length):
		var old_window := window
		var wg := get_window_value(attack, window, AG.WINDOW_GOTO)
		if(wg > 0):
			window = wg
		elif(window < get_attack_value(attack, AG.NUM_WINDOWS)):
			window += 1
		window_timer = 0
		
		if(old_window == window):
			window = 0
			window_timer = 0
			set_state(PS.IDLE)
	
	if(!hitstop):
		window_speed()
		window_create_hitbox()
		window_sound()

func window_speed():
	match int(get_window_value(attack, window, AG.WINDOW_SPEED_TYPE)):
		0:
			if(window_timer == 0):
				velocity += dir_input*get_window_value(attack, window, AG.WINDOW_SPEED)
		1:
			velocity = dir_input*get_window_value(attack, window, AG.WINDOW_SPEED)
		2:
			if(window_timer == 0):
				velocity = dir_input*get_window_value(attack, window, AG.WINDOW_SPEED)
				
func window_create_hitbox():
	var h_n := get_num_hitboxes(attack)
	if(h_n != 0):
		for i in range(h_n):
			var h_win := get_hitbox_value(attack, i+1, HG.WINDOW)
			if(h_win == window):
				var h_win_t := get_hitbox_value(attack, i+1, HG.WINDOW_CREATION_FRAME)
				if(h_win_t == window_timer):
					create_hitbox(attack, i+1, position.x, position.y)

func window_sound():
	pass

func create_hitbox(_attack, hbox_num, _x, _y):
	var new_hitbox = pHitBox.instance()
	new_hitbox.attack = attack
	new_hitbox.hbox_num = hbox_num
	new_hitbox.parent_id = self
	new_hitbox.collision_layer = 64
	new_hitbox.collision_mask = 32
	new_hitbox.declare()
	hitbox_parent.add_child(new_hitbox)
	pass

func enemy_hit(enemy_id:KinematicBody2D):
	#hit_sound.play()
	#var hfx := slash_hitfx.instance()
	#enemy_id.add_child(hfx)
	pass

func set_attack_value(_attack: int, index: int, value: float):
	attack_data.set_attack_value(_attack, index, value)

func get_attack_value(_attack: int, index: int) -> float:
	return attack_data.get_attack_value(_attack, index)

func set_window_value(_attack: int, _window: int, index: int, value: float):
	attack_data.set_window_value(_attack, _window, index, value)

func get_window_value(_attack: int, _window: int, index: int) -> float:
	return attack_data.get_window_value(_attack, _window, index)

func set_num_hitboxes(_attack: int, value: float):
	attack_data.set_num_hitboxes(_attack, value)
	
func get_num_hitboxes(_attack: int) -> float:
	return attack_data.get_num_hitboxes(_attack)

func set_hitbox_value(_attack: int, _hbox_num: int, index: int, value: float):
	attack_data.set_hitbox_value(_attack, _hbox_num, index, value)

func get_hitbox_value(_attack: int, _hbox_num: int, index: int) -> float:
	return attack_data.get_hitbox_value(_attack, _hbox_num, index)

func animation():
	match state:
		PS.IDLE, PS.HIT:
			sprite.animation = "all_walk"
			sprite.frame = 0
		PS.WALK:
			sprite.animation = "all_walk"
			sprite.frame = int(float(state_timer)*run_anim_speed) % 6
		PS.ATTACK:
			var frames = get_window_value(attack, window, AG.WINDOW_ANIM_FRAMES)
			var frame_start = get_window_value(attack, window, AG.WINDOW_ANIM_FRAME_START)
			var win_length = get_window_value(attack, window, AG.WINDOW_LENGTH)
			sprite.animation = "all_attack"
			sprite.frame = int(frame_start + window_timer*frames/win_length)


func _on_HurtboxComponent_area_entered(area: Hitbox):
	take_hit(area)

func take_hit(area: Hitbox):
	$HealthComponent.take_damage(area.damage)
	var angle = area.parent_id.dir_facing.rotated(area.angle).angle()
	velocity = Vector2(cos(angle), sin(angle))*area.knockback
	hitstun_time = area.hitstun
	set_state(PS.HIT)
	area.parent_id.enemy_hit(self)
	
func _on_HealthComponent_zero_health():
	#queue_free()
	pass
