extends Node

var attack_data : AttackData

class AttackData:
	var max_attacks = 10
	var max_indexes = 30
	var max_windows = 29
	
	var PS = Globals.PS
	var AT = Globals.AT
	var AG = Globals.AG
	var HG = Globals.HG
	
	var attack_data := []
	
	var window_data := []
	
	var hitbox_data := []
	var hitbox_amount := []
	
	func set_attack_value(attack: int, index: int, value: float):
		attack_data[index + attack*max_indexes] = value
	
	func get_attack_value(attack: int, index: int) -> float:
		return attack_data[index + attack*max_indexes]
	
	func set_window_value(attack: int, window: int, index: int, value: float):
		window_data[index + window*max_indexes + attack*max_indexes*max_windows] = value
	
	func get_window_value(attack: int, window: int, index: int) -> float:
		return window_data[index + window*max_indexes + attack*max_indexes*max_windows]
	
	func set_num_hitboxes(attack: int, value: float):
		hitbox_amount[attack] = value

	func get_num_hitboxes(attack: int) -> float:
		return hitbox_amount[attack]

	func set_hitbox_value(attack: int, window: int, index: int, value: float):
		hitbox_data[index + window*max_indexes + attack*max_indexes*max_windows] = value
	
	func get_hitbox_value(attack: int, window: int, index: int) -> float:
		return hitbox_data[index + window*max_indexes + attack*max_indexes*max_windows]
	
	func _init():
		attack_data.resize(max_indexes*max_attacks)
		attack_data.fill(0)
		window_data.resize(max_indexes*max_attacks*max_windows)
		window_data.fill(0)
		hitbox_data.resize(max_indexes*max_attacks*max_windows)
		hitbox_data.fill(0)
		hitbox_amount.resize(max_attacks)
		hitbox_amount.fill(0)
		load_proj_attack()
		load_swing_attack()
		load_charge_attack()
	
	func load_swing_attack():
		set_attack_value(AT.SWING, AG.NUM_WINDOWS, 3);
		
		set_window_value(AT.SWING, 1, AG.WINDOW_TYPE, 1);
		set_window_value(AT.SWING, 1, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.SWING, 1, AG.WINDOW_CUSTOM_FRICTION, .85);
		set_window_value(AT.SWING, 1, AG.WINDOW_LENGTH, 15);
		set_window_value(AT.SWING, 1, AG.WINDOW_ANIM_FRAMES, 2);
		set_window_value(AT.SWING, 1, AG.WINDOW_HAS_SFX, 1);
		set_window_value(AT.SWING, 1, AG.WINDOW_SFX, 0);
		set_window_value(AT.SWING, 1, AG.WINDOW_SFX_FRAME, 2);

		set_window_value(AT.SWING, 2, AG.WINDOW_TYPE, 1);
		set_window_value(AT.SWING, 2, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.SWING, 2, AG.WINDOW_CUSTOM_FRICTION, .1);
		set_window_value(AT.SWING, 2, AG.WINDOW_LENGTH, 3);
		set_window_value(AT.SWING, 2, AG.WINDOW_SPEED_TYPE, 2);
		set_window_value(AT.SWING, 2, AG.WINDOW_SPEED, 200.0);
		set_window_value(AT.SWING, 2, AG.WINDOW_ANIM_FRAMES, 1);
		set_window_value(AT.SWING, 2, AG.WINDOW_ANIM_FRAME_START, 2);

		set_window_value(AT.SWING, 3, AG.WINDOW_TYPE, 1);
		set_window_value(AT.SWING, 3, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.SWING, 3, AG.WINDOW_CUSTOM_FRICTION, 1);
		set_window_value(AT.SWING, 3, AG.WINDOW_LENGTH, 15);
		set_window_value(AT.SWING, 3, AG.WINDOW_ANIM_FRAMES, 2);
		set_window_value(AT.SWING, 3, AG.WINDOW_ANIM_FRAME_START, 3);
		
		set_num_hitboxes(AT.SWING, 1)
		
		set_hitbox_value(AT.SWING, 1, HG.WINDOW, 2);
		set_hitbox_value(AT.SWING, 1, HG.LIFETIME, 3);
		set_hitbox_value(AT.SWING, 1, HG.HITBOX_FORW, 14);
		set_hitbox_value(AT.SWING, 1, HG.HITBOX_SIDE, 0);
		set_hitbox_value(AT.SWING, 1, HG.WIDTH, 18);
		set_hitbox_value(AT.SWING, 1, HG.HEIGHT, 18);
		set_hitbox_value(AT.SWING, 1, HG.DAMAGE, 1);
		set_hitbox_value(AT.SWING, 1, HG.ANGLE, 0);
		set_hitbox_value(AT.SWING, 1, HG.KNOCKBACK, 400.0);
		set_hitbox_value(AT.SWING, 1, HG.HITSTUN, 25);
		
	func load_proj_attack():
		set_attack_value(AT.PROJ, AG.NUM_WINDOWS, 4);
		
		set_window_value(AT.PROJ, 1, AG.WINDOW_TYPE, 1);
		set_window_value(AT.PROJ, 1, AG.WINDOW_LENGTH, 5);
		set_window_value(AT.PROJ, 1, AG.WINDOW_ANIM_FRAMES, 2);
		set_window_value(AT.PROJ, 1, AG.WINDOW_HAS_SFX, 1);
		set_window_value(AT.PROJ, 1, AG.WINDOW_SFX, 0);
		set_window_value(AT.PROJ, 1, AG.WINDOW_SFX_FRAME, 2);

		set_window_value(AT.PROJ, 2, AG.WINDOW_TYPE, 1);
		set_window_value(AT.PROJ, 2, AG.WINDOW_GOTO, 2);
		set_window_value(AT.PROJ, 2, AG.WINDOW_LENGTH, 3);
		set_window_value(AT.PROJ, 2, AG.WINDOW_ANIM_FRAMES, 1);
		set_window_value(AT.PROJ, 2, AG.WINDOW_ANIM_FRAME_START, 1);

		set_window_value(AT.PROJ, 3, AG.WINDOW_TYPE, 1);
		set_window_value(AT.PROJ, 3, AG.WINDOW_LENGTH, 3);
		set_window_value(AT.PROJ, 3, AG.WINDOW_ANIM_FRAMES, 1);
		set_window_value(AT.PROJ, 3, AG.WINDOW_ANIM_FRAME_START, 2);
		
		set_window_value(AT.PROJ, 4, AG.WINDOW_TYPE, 1);
		set_window_value(AT.PROJ, 4, AG.WINDOW_LENGTH, 13);
		set_window_value(AT.PROJ, 4, AG.WINDOW_ANIM_FRAMES, 1);
		set_window_value(AT.PROJ, 4, AG.WINDOW_ANIM_FRAME_START, 3);
		
		set_num_hitboxes(AT.PROJ, 1)
		
		set_hitbox_value(AT.PROJ, 1, HG.HITBOX_TYPE, 2);
		set_hitbox_value(AT.PROJ, 1, HG.WINDOW, 3);
		set_hitbox_value(AT.PROJ, 1, HG.LIFETIME, 60);
		set_hitbox_value(AT.PROJ, 1, HG.HITBOX_FORW, 0);
		set_hitbox_value(AT.PROJ, 1, HG.HITBOX_SIDE, 0);
		set_hitbox_value(AT.PROJ, 1, HG.WIDTH, 18);
		set_hitbox_value(AT.PROJ, 1, HG.HEIGHT, 18);
		set_hitbox_value(AT.PROJ, 1, HG.DAMAGE, 1);
		set_hitbox_value(AT.PROJ, 1, HG.ANGLE, 0);
		set_hitbox_value(AT.PROJ, 1, HG.SPEED, 300.0);
		set_hitbox_value(AT.PROJ, 1, HG.HITSTUN, 25);
	
	func load_charge_attack():
		set_attack_value(AT.CHARGE, AG.NUM_WINDOWS, 3);
		
		set_window_value(AT.CHARGE, 1, AG.WINDOW_TYPE, 1);
		set_window_value(AT.CHARGE, 1, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.CHARGE, 1, AG.WINDOW_CUSTOM_FRICTION, .85);
		set_window_value(AT.CHARGE, 1, AG.WINDOW_LENGTH, 8);
		set_window_value(AT.CHARGE, 1, AG.WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT.CHARGE, 1, AG.WINDOW_HAS_SFX, 1);
		set_window_value(AT.CHARGE, 1, AG.WINDOW_SFX, 0);
		set_window_value(AT.CHARGE, 1, AG.WINDOW_SFX_FRAME, 2);

		set_window_value(AT.CHARGE, 2, AG.WINDOW_TYPE, 1);
		set_window_value(AT.CHARGE, 2, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.CHARGE, 2, AG.WINDOW_CUSTOM_FRICTION, .1);
		set_window_value(AT.CHARGE, 2, AG.WINDOW_LENGTH, 15);
		set_window_value(AT.CHARGE, 2, AG.WINDOW_SPEED_TYPE, 0);
		set_window_value(AT.CHARGE, 2, AG.WINDOW_SPEED, 200.0);
		set_window_value(AT.CHARGE, 2, AG.WINDOW_ANIM_FRAMES, 5);
		set_window_value(AT.CHARGE, 2, AG.WINDOW_ANIM_FRAME_START, 3);

		set_window_value(AT.CHARGE, 3, AG.WINDOW_TYPE, 1);
		set_window_value(AT.CHARGE, 3, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.CHARGE, 3, AG.WINDOW_CUSTOM_FRICTION, 1);
		set_window_value(AT.CHARGE, 3, AG.WINDOW_LENGTH, 15);
		set_window_value(AT.CHARGE, 3, AG.WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT.CHARGE, 3, AG.WINDOW_ANIM_FRAME_START, 8);
		
		set_num_hitboxes(AT.CHARGE, 5)
		
		set_hitbox_value(AT.CHARGE, 1, HG.WINDOW, 2);
		set_hitbox_value(AT.CHARGE, 1, HG.LIFETIME, 3);
		set_hitbox_value(AT.CHARGE, 1, HG.HITBOX_FORW, 14);
		set_hitbox_value(AT.CHARGE, 1, HG.HITBOX_SIDE, 0);
		set_hitbox_value(AT.CHARGE, 1, HG.WIDTH, 18);
		set_hitbox_value(AT.CHARGE, 1, HG.HEIGHT, 18);
		set_hitbox_value(AT.CHARGE, 1, HG.DAMAGE, 7);
		set_hitbox_value(AT.CHARGE, 1, HG.ANGLE, 0);
		set_hitbox_value(AT.CHARGE, 1, HG.KNOCKBACK, 400.0);
		set_hitbox_value(AT.CHARGE, 1, HG.HITSTUN, 25);
		
		set_hitbox_value(AT.CHARGE, 2, HG.WINDOW, 2);
		set_hitbox_value(AT.CHARGE, 2, HG.WINDOW_CREATION_FRAME, 3);
		set_hitbox_value(AT.CHARGE, 2, HG.LIFETIME, 3);
		set_hitbox_value(AT.CHARGE, 2, HG.HITBOX_FORW, 0);
		set_hitbox_value(AT.CHARGE, 2, HG.HITBOX_SIDE, -14);
		set_hitbox_value(AT.CHARGE, 2, HG.WIDTH, 18);
		set_hitbox_value(AT.CHARGE, 2, HG.HEIGHT, 18);
		set_hitbox_value(AT.CHARGE, 2, HG.DAMAGE, 7);
		set_hitbox_value(AT.CHARGE, 2, HG.ANGLE, -90);
		set_hitbox_value(AT.CHARGE, 2, HG.KNOCKBACK, 400.0);
		set_hitbox_value(AT.CHARGE, 2, HG.HITSTUN, 25);
		
		set_hitbox_value(AT.CHARGE, 3, HG.WINDOW, 2);
		set_hitbox_value(AT.CHARGE, 3, HG.WINDOW_CREATION_FRAME, 6);
		set_hitbox_value(AT.CHARGE, 3, HG.LIFETIME, 3);
		set_hitbox_value(AT.CHARGE, 3, HG.HITBOX_FORW, -14);
		set_hitbox_value(AT.CHARGE, 3, HG.HITBOX_SIDE, 0);
		set_hitbox_value(AT.CHARGE, 3, HG.WIDTH, 18);
		set_hitbox_value(AT.CHARGE, 3, HG.HEIGHT, 18);
		set_hitbox_value(AT.CHARGE, 3, HG.DAMAGE, 7);
		set_hitbox_value(AT.CHARGE, 3, HG.ANGLE, 180);
		set_hitbox_value(AT.CHARGE, 3, HG.KNOCKBACK, 400.0);
		set_hitbox_value(AT.CHARGE, 3, HG.HITSTUN, 25);
		
		set_hitbox_value(AT.CHARGE, 4, HG.WINDOW, 2);
		set_hitbox_value(AT.CHARGE, 4, HG.WINDOW_CREATION_FRAME, 9);
		set_hitbox_value(AT.CHARGE, 4, HG.LIFETIME, 3);
		set_hitbox_value(AT.CHARGE, 4, HG.HITBOX_FORW, 0);
		set_hitbox_value(AT.CHARGE, 4, HG.HITBOX_SIDE, 14);
		set_hitbox_value(AT.CHARGE, 4, HG.WIDTH, 18);
		set_hitbox_value(AT.CHARGE, 4, HG.HEIGHT, 18);
		set_hitbox_value(AT.CHARGE, 4, HG.DAMAGE, 7);
		set_hitbox_value(AT.CHARGE, 4, HG.ANGLE, 90);
		set_hitbox_value(AT.CHARGE, 4, HG.KNOCKBACK, 400.0);
		set_hitbox_value(AT.CHARGE, 4, HG.HITSTUN, 25);
		
		set_hitbox_value(AT.CHARGE, 5, HG.WINDOW, 2);
		set_hitbox_value(AT.CHARGE, 5, HG.WINDOW_CREATION_FRAME, 12);
		set_hitbox_value(AT.CHARGE, 5, HG.LIFETIME, 3);
		set_hitbox_value(AT.CHARGE, 5, HG.HITBOX_FORW, 14);
		set_hitbox_value(AT.CHARGE, 5, HG.HITBOX_SIDE, 0);
		set_hitbox_value(AT.CHARGE, 5, HG.WIDTH, 18);
		set_hitbox_value(AT.CHARGE, 5, HG.HEIGHT, 18);
		set_hitbox_value(AT.CHARGE, 5, HG.DAMAGE, 1);
		set_hitbox_value(AT.CHARGE, 5, HG.ANGLE, 0);
		set_hitbox_value(AT.CHARGE, 5, HG.KNOCKBACK, 400.0);
		set_hitbox_value(AT.CHARGE, 5, HG.HITSTUN, 25);
	
func _init():
	attack_data = AttackData.new()
	
