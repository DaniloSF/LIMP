extends Node

var sap_slime_attack_data : SapSlimeAttackData

class AttackData:
	
	var max_attacks:int
	var max_indexes:int
	var max_windows:int
	
	var PS:Dictionary
	var AT:Dictionary
	var AG:Dictionary
	var HG:Dictionary
	
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

class SapSlimeAttackData extends AttackData:
	
	func _init():
		
		PS = Globals.SS_PS
		AT = Globals.SS_AT
		AG = Globals.AG
		HG = Globals.HG
		
		max_attacks = 1
		max_indexes = 30
		max_windows = 10
		
		attack_data.resize(max_indexes*max_attacks)
		attack_data.fill(0)
		window_data.resize(max_indexes*max_attacks*max_windows)
		window_data.fill(0)
		hitbox_data.resize(max_indexes*max_attacks*max_windows)
		hitbox_data.fill(0)
		hitbox_amount.resize(max_attacks)
		hitbox_amount.fill(0)
		load_lunge_attack()
		
	
	func load_lunge_attack():
		set_attack_value(AT.LUNGE, AG.NUM_WINDOWS, 3);
		
		set_window_value(AT.LUNGE, 1, AG.WINDOW_TYPE, 1);
		set_window_value(AT.LUNGE, 1, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.LUNGE, 1, AG.WINDOW_CUSTOM_FRICTION, .85);
		set_window_value(AT.LUNGE, 1, AG.WINDOW_LENGTH, 30);
		set_window_value(AT.LUNGE, 1, AG.WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT.LUNGE, 1, AG.WINDOW_HAS_SFX, 1);
		set_window_value(AT.LUNGE, 1, AG.WINDOW_SFX, 0);
		set_window_value(AT.LUNGE, 1, AG.WINDOW_SFX_FRAME, 2);

		set_window_value(AT.LUNGE, 2, AG.WINDOW_TYPE, 1);
		set_window_value(AT.LUNGE, 2, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.LUNGE, 2, AG.WINDOW_CUSTOM_FRICTION, .7);
		set_window_value(AT.LUNGE, 2, AG.WINDOW_LENGTH, 12);
		set_window_value(AT.LUNGE, 2, AG.WINDOW_SPEED_TYPE, 0);
		set_window_value(AT.LUNGE, 2, AG.WINDOW_SPEED, 400.0);
		set_window_value(AT.LUNGE, 2, AG.WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT.LUNGE, 2, AG.WINDOW_ANIM_FRAME_START, 3);

		set_window_value(AT.LUNGE, 3, AG.WINDOW_TYPE, 1);
		set_window_value(AT.LUNGE, 3, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.LUNGE, 3, AG.WINDOW_CUSTOM_FRICTION, 1);
		set_window_value(AT.LUNGE, 3, AG.WINDOW_LENGTH, 15);
		set_window_value(AT.LUNGE, 3, AG.WINDOW_ANIM_FRAMES, 4);
		set_window_value(AT.LUNGE, 3, AG.WINDOW_ANIM_FRAME_START, 6);
		
		set_num_hitboxes(AT.LUNGE, 1)
		
		set_hitbox_value(AT.LUNGE, 1, HG.WINDOW, 2);
		set_hitbox_value(AT.LUNGE, 1, HG.LIFETIME, 12);
		set_hitbox_value(AT.LUNGE, 1, HG.HITBOX_FORW, 0);
		set_hitbox_value(AT.LUNGE, 1, HG.HITBOX_SIDE, 0);
		set_hitbox_value(AT.LUNGE, 1, HG.WIDTH, 12);
		set_hitbox_value(AT.LUNGE, 1, HG.HEIGHT, 12);
		set_hitbox_value(AT.LUNGE, 1, HG.DAMAGE, 1);
		set_hitbox_value(AT.LUNGE, 1, HG.KNOCKBACK, 300);
		set_hitbox_value(AT.LUNGE, 1, HG.HITSTUN, 14);

var pumpkin_attack_data : PumpkinAttackData

class PumpkinAttackData extends AttackData:

	func _init():
		
		max_attacks = 1
		max_indexes = 30
		max_windows = 10
		
		PS = Globals.P_PS
		AT = Globals.P_AT
		AG = Globals.AG
		HG = Globals.HG
		
		attack_data.resize(max_indexes*max_attacks)
		attack_data.fill(0)
		window_data.resize(max_indexes*max_attacks*max_windows)
		window_data.fill(0)
		hitbox_data.resize(max_indexes*max_attacks*max_windows)
		hitbox_data.fill(0)
		hitbox_amount.resize(max_attacks)
		hitbox_amount.fill(0)
		load_jump_attack()
		
	
	func load_jump_attack():
		set_attack_value(AT.LUNGE, AG.NUM_WINDOWS, 5);
		
		set_window_value(AT.LUNGE, 1, AG.WINDOW_TYPE, 1);
		set_window_value(AT.LUNGE, 1, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.LUNGE, 1, AG.WINDOW_CUSTOM_FRICTION, .85);
		set_window_value(AT.LUNGE, 1, AG.WINDOW_LENGTH, 30);
		set_window_value(AT.LUNGE, 1, AG.WINDOW_ANIM_FRAMES, 5);

		set_window_value(AT.LUNGE, 2, AG.WINDOW_TYPE, 1);
		set_window_value(AT.LUNGE, 2, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.LUNGE, 2, AG.WINDOW_CUSTOM_FRICTION, 0);
		set_window_value(AT.LUNGE, 2, AG.WINDOW_LENGTH, 12);
		set_window_value(AT.LUNGE, 2, AG.WINDOW_SPEED_TYPE, 0);
		set_window_value(AT.LUNGE, 2, AG.WINDOW_SPEED, 400.0);
		set_window_value(AT.LUNGE, 2, AG.WINDOW_ANIM_FRAMES, 2);
		set_window_value(AT.LUNGE, 2, AG.WINDOW_ANIM_FRAME_START, 5);
		
		set_window_value(AT.LUNGE, 3, AG.WINDOW_TYPE, 1);
		set_window_value(AT.LUNGE, 3, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.LUNGE, 3, AG.WINDOW_CUSTOM_FRICTION, 5);
		set_window_value(AT.LUNGE, 3, AG.WINDOW_LENGTH, 20);
		set_window_value(AT.LUNGE, 3, AG.WINDOW_SPEED_TYPE, 0);
		set_window_value(AT.LUNGE, 3, AG.WINDOW_SPEED, 0);
		set_window_value(AT.LUNGE, 3, AG.WINDOW_ANIM_FRAMES, 1);
		set_window_value(AT.LUNGE, 3, AG.WINDOW_ANIM_FRAME_START, 7);
		
		set_window_value(AT.LUNGE, 4, AG.WINDOW_TYPE, 1);
		set_window_value(AT.LUNGE, 4, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.LUNGE, 4, AG.WINDOW_CUSTOM_FRICTION, 5);
		set_window_value(AT.LUNGE, 4, AG.WINDOW_LENGTH, 7);
		set_window_value(AT.LUNGE, 4, AG.WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT.LUNGE, 4, AG.WINDOW_ANIM_FRAME_START, 8);
		
		set_window_value(AT.LUNGE, 5, AG.WINDOW_TYPE, 1);
		set_window_value(AT.LUNGE, 5, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.LUNGE, 5, AG.WINDOW_CUSTOM_FRICTION, 5);
		set_window_value(AT.LUNGE, 5, AG.WINDOW_LENGTH, 7);
		set_window_value(AT.LUNGE, 5, AG.WINDOW_ANIM_FRAMES, 1);
		set_window_value(AT.LUNGE, 5, AG.WINDOW_ANIM_FRAME_START, 11);
		
		set_window_value(AT.LUNGE, 6, AG.WINDOW_TYPE, 1);
		set_window_value(AT.LUNGE, 6, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.LUNGE, 6, AG.WINDOW_CUSTOM_FRICTION, 5);
		set_window_value(AT.LUNGE, 6, AG.WINDOW_LENGTH, 7);
		set_window_value(AT.LUNGE, 6, AG.WINDOW_ANIM_FRAMES, 2);
		set_window_value(AT.LUNGE, 6, AG.WINDOW_ANIM_FRAME_START, 12);
		
		set_num_hitboxes(AT.LUNGE, 1)
		
		set_hitbox_value(AT.LUNGE, 1, HG.WINDOW, 5);
		set_hitbox_value(AT.LUNGE, 1, HG.LIFETIME, 12);
		set_hitbox_value(AT.LUNGE, 1, HG.HITBOX_FORW, 0);
		set_hitbox_value(AT.LUNGE, 1, HG.HITBOX_SIDE, 0);
		set_hitbox_value(AT.LUNGE, 1, HG.WIDTH, 20);
		set_hitbox_value(AT.LUNGE, 1, HG.HEIGHT, 20);
		set_hitbox_value(AT.LUNGE, 1, HG.DAMAGE, 1);
		set_hitbox_value(AT.LUNGE, 1, HG.KNOCKBACK, 450);
		set_hitbox_value(AT.LUNGE, 1, HG.HITSTUN, 14);

var gobbler_attack_data : GobblerAttackData

class GobblerAttackData extends AttackData:

	func _init():
		
		max_attacks = 1
		max_indexes = 30
		max_windows = 10
		
		PS = Globals.P_PS
		AT = Globals.P_AT
		AG = Globals.AG
		HG = Globals.HG
		
		attack_data.resize(max_indexes*max_attacks)
		attack_data.fill(0)
		window_data.resize(max_indexes*max_attacks*max_windows)
		window_data.fill(0)
		hitbox_data.resize(max_indexes*max_attacks*max_windows)
		hitbox_data.fill(0)
		hitbox_amount.resize(max_attacks)
		hitbox_amount.fill(0)
		load_gobble_attack()
		
	
	func load_gobble_attack():
		set_attack_value(AT.LUNGE, AG.NUM_WINDOWS, 3);
		
		set_window_value(AT.LUNGE, 1, AG.WINDOW_TYPE, 1);
		set_window_value(AT.LUNGE, 1, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.LUNGE, 1, AG.WINDOW_CUSTOM_FRICTION, 0);
		set_window_value(AT.LUNGE, 1, AG.WINDOW_LENGTH, 30);
		set_window_value(AT.LUNGE, 1, AG.WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT.LUNGE, 1, AG.WINDOW_HAS_SFX, 1);
		set_window_value(AT.LUNGE, 1, AG.WINDOW_SFX, 0);
		set_window_value(AT.LUNGE, 1, AG.WINDOW_SFX_FRAME, 2);

		set_window_value(AT.LUNGE, 2, AG.WINDOW_TYPE, 1);
		set_window_value(AT.LUNGE, 2, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.LUNGE, 2, AG.WINDOW_CUSTOM_FRICTION, 2);
		set_window_value(AT.LUNGE, 2, AG.WINDOW_LENGTH, 12);
		set_window_value(AT.LUNGE, 2, AG.WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT.LUNGE, 2, AG.WINDOW_ANIM_FRAME_START, 3);

		set_window_value(AT.LUNGE, 3, AG.WINDOW_TYPE, 1);
		set_window_value(AT.LUNGE, 3, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.LUNGE, 3, AG.WINDOW_CUSTOM_FRICTION, 1);
		set_window_value(AT.LUNGE, 3, AG.WINDOW_LENGTH, 15);
		set_window_value(AT.LUNGE, 3, AG.WINDOW_ANIM_FRAMES, 4);
		set_window_value(AT.LUNGE, 3, AG.WINDOW_ANIM_FRAME_START, 6);
		
		set_num_hitboxes(AT.LUNGE, 1)
		
		set_hitbox_value(AT.LUNGE, 1, HG.WINDOW, 2);
		set_hitbox_value(AT.LUNGE, 1, HG.LIFETIME, 12);
		set_hitbox_value(AT.LUNGE, 1, HG.HITBOX_FORW, 10);
		set_hitbox_value(AT.LUNGE, 1, HG.HITBOX_SIDE, 0);
		set_hitbox_value(AT.LUNGE, 1, HG.WIDTH, 20);
		set_hitbox_value(AT.LUNGE, 1, HG.HEIGHT, 12);
		set_hitbox_value(AT.LUNGE, 1, HG.DAMAGE, 1);
		set_hitbox_value(AT.LUNGE, 1, HG.KNOCKBACK, 300);
		set_hitbox_value(AT.LUNGE, 1, HG.HITSTUN, 14);

var cactus_attack_data : CactusAttackData

class CactusAttackData extends AttackData:

	func _init():
		
		max_attacks = 1
		max_indexes = 30
		max_windows = 10
		
		PS = Globals.C_PS
		AT = Globals.C_AT
		AG = Globals.AG
		HG = Globals.HG
		
		attack_data.resize(max_indexes*max_attacks)
		attack_data.fill(0)
		window_data.resize(max_indexes*max_attacks*max_windows)
		window_data.fill(0)
		hitbox_data.resize(max_indexes*max_attacks*max_windows)
		hitbox_data.fill(0)
		hitbox_amount.resize(max_attacks)
		hitbox_amount.fill(0)
		load_explode_attack()
		
	
	func load_explode_attack():
		set_attack_value(AT.LUNGE, AG.NUM_WINDOWS, 3);
		
		set_window_value(AT.LUNGE, 1, AG.WINDOW_TYPE, 1);
		set_window_value(AT.LUNGE, 1, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.LUNGE, 1, AG.WINDOW_CUSTOM_FRICTION, .85);
		set_window_value(AT.LUNGE, 1, AG.WINDOW_LENGTH, 20);
		set_window_value(AT.LUNGE, 1, AG.WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT.LUNGE, 1, AG.WINDOW_HAS_SFX, 1);
		set_window_value(AT.LUNGE, 1, AG.WINDOW_SFX, 0);
		set_window_value(AT.LUNGE, 1, AG.WINDOW_SFX_FRAME, 2);

		set_window_value(AT.LUNGE, 2, AG.WINDOW_TYPE, 1);
		set_window_value(AT.LUNGE, 2, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.LUNGE, 2, AG.WINDOW_CUSTOM_FRICTION, 2);
		set_window_value(AT.LUNGE, 2, AG.WINDOW_LENGTH, 12);
		set_window_value(AT.LUNGE, 2, AG.WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT.LUNGE, 2, AG.WINDOW_ANIM_FRAME_START, 3);

		set_window_value(AT.LUNGE, 3, AG.WINDOW_TYPE, 1);
		set_window_value(AT.LUNGE, 3, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.LUNGE, 3, AG.WINDOW_CUSTOM_FRICTION, 1);
		set_window_value(AT.LUNGE, 3, AG.WINDOW_LENGTH, 15);
		set_window_value(AT.LUNGE, 3, AG.WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT.LUNGE, 3, AG.WINDOW_ANIM_FRAME_START, 6);
		
		set_num_hitboxes(AT.LUNGE, 1)
		
		set_hitbox_value(AT.LUNGE, 1, HG.WINDOW, 2);
		set_hitbox_value(AT.LUNGE, 1, HG.LIFETIME, 12);
		set_hitbox_value(AT.LUNGE, 1, HG.HITBOX_FORW, 0);
		set_hitbox_value(AT.LUNGE, 1, HG.HITBOX_SIDE, 0);
		set_hitbox_value(AT.LUNGE, 1, HG.WIDTH, 20);
		set_hitbox_value(AT.LUNGE, 1, HG.HEIGHT, 20);
		set_hitbox_value(AT.LUNGE, 1, HG.DAMAGE, 1);
		set_hitbox_value(AT.LUNGE, 1, HG.KNOCKBACK, 300);
		set_hitbox_value(AT.LUNGE, 1, HG.HITSTUN, 14);

var moss_ske_attack_data : MossSkeletonAttackData

class MossSkeletonAttackData extends AttackData:

	func _init():
		
		max_attacks = 1
		max_indexes = 30
		max_windows = 10
		
		PS = Globals.MS_PS
		AT = Globals.MS_AT
		AG = Globals.AG
		HG = Globals.HG
		
		attack_data.resize(max_indexes*max_attacks)
		attack_data.fill(0)
		window_data.resize(max_indexes*max_attacks*max_windows)
		window_data.fill(0)
		hitbox_data.resize(max_indexes*max_attacks*max_windows)
		hitbox_data.fill(0)
		hitbox_amount.resize(max_attacks)
		hitbox_amount.fill(0)
		load_explode_attack()
		
	
	func load_explode_attack():
		set_attack_value(AT.SPIN, AG.NUM_WINDOWS, 3);
		
		set_window_value(AT.SPIN, 1, AG.WINDOW_TYPE, 1);
		set_window_value(AT.SPIN, 1, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.SPIN, 1, AG.WINDOW_CUSTOM_FRICTION, 1);
		set_window_value(AT.SPIN, 1, AG.WINDOW_LENGTH, 30);
		set_window_value(AT.SPIN, 1, AG.WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT.SPIN, 1, AG.WINDOW_HAS_SFX, 1);
		set_window_value(AT.SPIN, 1, AG.WINDOW_SFX, 0);
		set_window_value(AT.SPIN, 1, AG.WINDOW_SFX_FRAME, 2);

		set_window_value(AT.SPIN, 2, AG.WINDOW_TYPE, 1);
		set_window_value(AT.SPIN, 2, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.SPIN, 2, AG.WINDOW_CUSTOM_FRICTION, 1);
		set_window_value(AT.SPIN, 2, AG.WINDOW_LENGTH, 15);
		set_window_value(AT.SPIN, 2, AG.WINDOW_SPEED_TYPE, 0);
		set_window_value(AT.SPIN, 2, AG.WINDOW_SPEED, 0.0);
		set_window_value(AT.SPIN, 2, AG.WINDOW_ANIM_FRAMES, 5);
		set_window_value(AT.SPIN, 2, AG.WINDOW_ANIM_FRAME_START, 3);

		set_window_value(AT.SPIN, 3, AG.WINDOW_TYPE, 1);
		set_window_value(AT.SPIN, 3, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.SPIN, 3, AG.WINDOW_CUSTOM_FRICTION, 1);
		set_window_value(AT.SPIN, 3, AG.WINDOW_LENGTH, 15);
		set_window_value(AT.SPIN, 3, AG.WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT.SPIN, 3, AG.WINDOW_ANIM_FRAME_START, 8);
		
		set_num_hitboxes(AT.SPIN, 5)
		
		set_hitbox_value(AT.SPIN, 1, HG.WINDOW, 2);
		set_hitbox_value(AT.SPIN, 1, HG.LIFETIME, 3);
		set_hitbox_value(AT.SPIN, 1, HG.HITBOX_FORW, 14);
		set_hitbox_value(AT.SPIN, 1, HG.HITBOX_SIDE, 0);
		set_hitbox_value(AT.SPIN, 1, HG.WIDTH, 18);
		set_hitbox_value(AT.SPIN, 1, HG.HEIGHT, 18);
		set_hitbox_value(AT.SPIN, 1, HG.DAMAGE, 1);
		set_hitbox_value(AT.SPIN, 1, HG.ANGLE, 0);
		set_hitbox_value(AT.SPIN, 1, HG.KNOCKBACK, 400.0);
		set_hitbox_value(AT.SPIN, 1, HG.HITSTUN, 25);
		
		set_hitbox_value(AT.SPIN, 2, HG.WINDOW, 2);
		set_hitbox_value(AT.SPIN, 2, HG.WINDOW_CREATION_FRAME, 3);
		set_hitbox_value(AT.SPIN, 2, HG.LIFETIME, 3);
		set_hitbox_value(AT.SPIN, 2, HG.HITBOX_FORW, 0);
		set_hitbox_value(AT.SPIN, 2, HG.HITBOX_SIDE, -14);
		set_hitbox_value(AT.SPIN, 2, HG.WIDTH, 18);
		set_hitbox_value(AT.SPIN, 2, HG.HEIGHT, 18);
		set_hitbox_value(AT.SPIN, 2, HG.DAMAGE, 1);
		set_hitbox_value(AT.SPIN, 2, HG.ANGLE, -90);
		set_hitbox_value(AT.SPIN, 2, HG.KNOCKBACK, 400.0);
		set_hitbox_value(AT.SPIN, 2, HG.HITSTUN, 25);
		
		set_hitbox_value(AT.SPIN, 3, HG.WINDOW, 2);
		set_hitbox_value(AT.SPIN, 3, HG.WINDOW_CREATION_FRAME, 6);
		set_hitbox_value(AT.SPIN, 3, HG.LIFETIME, 3);
		set_hitbox_value(AT.SPIN, 3, HG.HITBOX_FORW, -14);
		set_hitbox_value(AT.SPIN, 3, HG.HITBOX_SIDE, 0);
		set_hitbox_value(AT.SPIN, 3, HG.WIDTH, 18);
		set_hitbox_value(AT.SPIN, 3, HG.HEIGHT, 18);
		set_hitbox_value(AT.SPIN, 3, HG.DAMAGE, 1);
		set_hitbox_value(AT.SPIN, 3, HG.ANGLE, 180);
		set_hitbox_value(AT.SPIN, 3, HG.KNOCKBACK, 400.0);
		set_hitbox_value(AT.SPIN, 3, HG.HITSTUN, 25);
		
		set_hitbox_value(AT.SPIN, 4, HG.WINDOW, 2);
		set_hitbox_value(AT.SPIN, 4, HG.WINDOW_CREATION_FRAME, 9);
		set_hitbox_value(AT.SPIN, 4, HG.LIFETIME, 3);
		set_hitbox_value(AT.SPIN, 4, HG.HITBOX_FORW, 0);
		set_hitbox_value(AT.SPIN, 4, HG.HITBOX_SIDE, 14);
		set_hitbox_value(AT.SPIN, 4, HG.WIDTH, 18);
		set_hitbox_value(AT.SPIN, 4, HG.HEIGHT, 18);
		set_hitbox_value(AT.SPIN, 4, HG.DAMAGE, 1);
		set_hitbox_value(AT.SPIN, 4, HG.ANGLE, 90);
		set_hitbox_value(AT.SPIN, 4, HG.KNOCKBACK, 400.0);
		set_hitbox_value(AT.SPIN, 4, HG.HITSTUN, 25);
		
		set_hitbox_value(AT.SPIN, 5, HG.WINDOW, 2);
		set_hitbox_value(AT.SPIN, 5, HG.WINDOW_CREATION_FRAME, 12);
		set_hitbox_value(AT.SPIN, 5, HG.LIFETIME, 3);
		set_hitbox_value(AT.SPIN, 5, HG.HITBOX_FORW, 14);
		set_hitbox_value(AT.SPIN, 5, HG.HITBOX_SIDE, 0);
		set_hitbox_value(AT.SPIN, 5, HG.WIDTH, 18);
		set_hitbox_value(AT.SPIN, 5, HG.HEIGHT, 18);
		set_hitbox_value(AT.SPIN, 5, HG.DAMAGE, 1);
		set_hitbox_value(AT.SPIN, 5, HG.ANGLE, 0);
		set_hitbox_value(AT.SPIN, 5, HG.KNOCKBACK, 400.0);
		set_hitbox_value(AT.SPIN, 5, HG.HITSTUN, 25);

var skeleton_attack_data : SkeletonAttackData

class SkeletonAttackData extends AttackData:

	func _init():
		
		max_attacks = 1
		max_indexes = 30
		max_windows = 10
		
		PS = Globals.S_PS
		AT = Globals.S_AT
		AG = Globals.AG
		HG = Globals.HG
		
		attack_data.resize(max_indexes*max_attacks)
		attack_data.fill(0)
		window_data.resize(max_indexes*max_attacks*max_windows)
		window_data.fill(0)
		hitbox_data.resize(max_indexes*max_attacks*max_windows)
		hitbox_data.fill(0)
		hitbox_amount.resize(max_attacks)
		hitbox_amount.fill(0)
		load_throw_attack()
		
	
	func load_throw_attack():
		set_attack_value(AT.THROW, AG.NUM_WINDOWS, 3);
		
		set_window_value(AT.THROW, 1, AG.WINDOW_TYPE, 1);
		set_window_value(AT.THROW, 1, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.THROW, 1, AG.WINDOW_CUSTOM_FRICTION, .85);
		set_window_value(AT.THROW, 1, AG.WINDOW_LENGTH, 20);
		set_window_value(AT.THROW, 1, AG.WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT.THROW, 1, AG.WINDOW_HAS_SFX, 1);
		set_window_value(AT.THROW, 1, AG.WINDOW_SFX, 0);
		set_window_value(AT.THROW, 1, AG.WINDOW_SFX_FRAME, 2);

		set_window_value(AT.THROW, 2, AG.WINDOW_TYPE, 1);
		set_window_value(AT.THROW, 2, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.THROW, 2, AG.WINDOW_CUSTOM_FRICTION, 2);
		set_window_value(AT.THROW, 2, AG.WINDOW_LENGTH, 12);
		set_window_value(AT.THROW, 2, AG.WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT.THROW, 2, AG.WINDOW_ANIM_FRAME_START, 3);

		set_window_value(AT.THROW, 3, AG.WINDOW_TYPE, 1);
		set_window_value(AT.THROW, 3, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.THROW, 3, AG.WINDOW_CUSTOM_FRICTION, 1);
		set_window_value(AT.THROW, 3, AG.WINDOW_LENGTH, 30);
		set_window_value(AT.THROW, 3, AG.WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT.THROW, 3, AG.WINDOW_ANIM_FRAME_START, 6);
		
		set_num_hitboxes(AT.THROW, 1)
		
		set_hitbox_value(AT.THROW, 1, HG.HITBOX_TYPE, 2);
		set_hitbox_value(AT.THROW, 1, HG.WINDOW, 2);
		set_hitbox_value(AT.THROW, 1, HG.LIFETIME, 30);
		set_hitbox_value(AT.THROW, 1, HG.HITBOX_FORW, 0);
		set_hitbox_value(AT.THROW, 1, HG.HITBOX_SIDE, 0);
		set_hitbox_value(AT.THROW, 1, HG.WIDTH, 9);
		set_hitbox_value(AT.THROW, 1, HG.HEIGHT, 9);
		set_hitbox_value(AT.THROW, 1, HG.DAMAGE, 1);
		set_hitbox_value(AT.THROW, 1, HG.KNOCKBACK, 300);
		set_hitbox_value(AT.THROW, 1, HG.SPEED, 140.0);
		set_hitbox_value(AT.THROW, 1, HG.HITSTUN, 14);

var evil_oak_attack_data : EvilOakAttackData

class EvilOakAttackData extends AttackData:

	func _init():
		
		max_attacks = 3
		max_indexes = 40
		max_windows = 10
		
		PS = Globals.EO_PS
		AT = Globals.EO_AT
		AG = Globals.AG
		HG = Globals.HG
		
		attack_data.resize(max_indexes*max_attacks)
		attack_data.fill(0)
		window_data.resize(max_indexes*max_attacks*max_windows)
		window_data.fill(0)
		hitbox_data.resize(max_indexes*max_attacks*max_windows)
		hitbox_data.fill(0)
		hitbox_amount.resize(max_attacks)
		hitbox_amount.fill(0)
		load_throw_attack()
		load_beam_attack()
		load_contact_attack()
	
	func load_throw_attack():
		set_attack_value(AT.THROW, AG.NUM_WINDOWS, 3);
		
		set_window_value(AT.THROW, 1, AG.WINDOW_TYPE, 1);
		set_window_value(AT.THROW, 1, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.THROW, 1, AG.WINDOW_CUSTOM_FRICTION, .85);
		set_window_value(AT.THROW, 1, AG.WINDOW_LENGTH, 20);
		set_window_value(AT.THROW, 1, AG.WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT.THROW, 1, AG.WINDOW_HAS_SFX, 1);
		set_window_value(AT.THROW, 1, AG.WINDOW_SFX, 0);
		set_window_value(AT.THROW, 1, AG.WINDOW_SFX_FRAME, 2);

		set_window_value(AT.THROW, 2, AG.WINDOW_TYPE, 1);
		set_window_value(AT.THROW, 2, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.THROW, 2, AG.WINDOW_CUSTOM_FRICTION, 2);
		set_window_value(AT.THROW, 2, AG.WINDOW_LENGTH, 12);
		set_window_value(AT.THROW, 2, AG.WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT.THROW, 2, AG.WINDOW_ANIM_FRAME_START, 3);

		set_window_value(AT.THROW, 3, AG.WINDOW_TYPE, 1);
		set_window_value(AT.THROW, 3, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.THROW, 3, AG.WINDOW_CUSTOM_FRICTION, 1);
		set_window_value(AT.THROW, 3, AG.WINDOW_LENGTH, 30);
		set_window_value(AT.THROW, 3, AG.WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT.THROW, 3, AG.WINDOW_ANIM_FRAME_START, 6);
		
		set_num_hitboxes(AT.THROW, 1)
		
		set_hitbox_value(AT.THROW, 1, HG.HITBOX_TYPE, 2);
		set_hitbox_value(AT.THROW, 1, HG.WINDOW, 2);
		set_hitbox_value(AT.THROW, 1, HG.LIFETIME, 180);
		set_hitbox_value(AT.THROW, 1, HG.HITBOX_FORW, 0);
		set_hitbox_value(AT.THROW, 1, HG.HITBOX_SIDE, 0);
		set_hitbox_value(AT.THROW, 1, HG.WIDTH, 8);
		set_hitbox_value(AT.THROW, 1, HG.HEIGHT, 8);
		set_hitbox_value(AT.THROW, 1, HG.DAMAGE, 1);
		set_hitbox_value(AT.THROW, 1, HG.KNOCKBACK, 300);
		set_hitbox_value(AT.THROW, 1, HG.SPEED, 140.0);
		set_hitbox_value(AT.THROW, 1, HG.HITSTUN, 14);
	
	func load_beam_attack():
		set_attack_value(AT.BEAM, AG.NUM_WINDOWS, 3);
		
		set_window_value(AT.BEAM, 1, AG.WINDOW_TYPE, 1);
		set_window_value(AT.BEAM, 1, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.BEAM, 1, AG.WINDOW_CUSTOM_FRICTION, .85);
		set_window_value(AT.BEAM, 1, AG.WINDOW_LENGTH, 20);
		set_window_value(AT.BEAM, 1, AG.WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT.BEAM, 1, AG.WINDOW_HAS_SFX, 1);
		set_window_value(AT.BEAM, 1, AG.WINDOW_SFX, 0);
		set_window_value(AT.BEAM, 1, AG.WINDOW_SFX_FRAME, 2);

		set_window_value(AT.BEAM, 2, AG.WINDOW_TYPE, 1);
		set_window_value(AT.BEAM, 2, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.BEAM, 2, AG.WINDOW_CUSTOM_FRICTION, 2);
		set_window_value(AT.BEAM, 2, AG.WINDOW_LENGTH, 12);
		set_window_value(AT.BEAM, 2, AG.WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT.BEAM, 2, AG.WINDOW_ANIM_FRAME_START, 3);

		set_window_value(AT.BEAM, 3, AG.WINDOW_TYPE, 1);
		set_window_value(AT.BEAM, 3, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.BEAM, 3, AG.WINDOW_CUSTOM_FRICTION, 1);
		set_window_value(AT.BEAM, 3, AG.WINDOW_LENGTH, 30);
		set_window_value(AT.BEAM, 3, AG.WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT.BEAM, 3, AG.WINDOW_ANIM_FRAME_START, 6);
		
		set_num_hitboxes(AT.BEAM, 1)
		
		set_hitbox_value(AT.BEAM, 1, HG.HITBOX_TYPE, 2);
		set_hitbox_value(AT.BEAM, 1, HG.WINDOW, 2);
		set_hitbox_value(AT.BEAM, 1, HG.LIFETIME, 30);
		set_hitbox_value(AT.BEAM, 1, HG.HITBOX_FORW, 0);
		set_hitbox_value(AT.BEAM, 1, HG.HITBOX_SIDE, 0);
		set_hitbox_value(AT.BEAM, 1, HG.WIDTH, 20);
		set_hitbox_value(AT.BEAM, 1, HG.HEIGHT, 20);
		set_hitbox_value(AT.BEAM, 1, HG.DAMAGE, 1);
		set_hitbox_value(AT.BEAM, 1, HG.KNOCKBACK, 300);
		set_hitbox_value(AT.BEAM, 1, HG.ROTATION, PI/16);
		set_hitbox_value(AT.BEAM, 1, HG.SPEED, 0.0);
		set_hitbox_value(AT.BEAM, 1, HG.HITSTUN, 14);
	
	func load_contact_attack():
		set_attack_value(AT.CONTACT, AG.NUM_WINDOWS, 3);
		
		set_window_value(AT.CONTACT, 1, AG.WINDOW_TYPE, 1);
		set_window_value(AT.CONTACT, 1, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.CONTACT, 1, AG.WINDOW_CUSTOM_FRICTION, .85);
		set_window_value(AT.CONTACT, 1, AG.WINDOW_LENGTH, 1);
		set_window_value(AT.CONTACT, 1, AG.WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT.CONTACT, 1, AG.WINDOW_HAS_SFX, 1);
		set_window_value(AT.CONTACT, 1, AG.WINDOW_SFX, 0);
		set_window_value(AT.CONTACT, 1, AG.WINDOW_SFX_FRAME, 2);

		set_window_value(AT.CONTACT, 2, AG.WINDOW_TYPE, 1);
		set_window_value(AT.CONTACT, 2, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.CONTACT, 2, AG.WINDOW_CUSTOM_FRICTION, 2);
		set_window_value(AT.CONTACT, 2, AG.WINDOW_LENGTH, 2);
		set_window_value(AT.CONTACT, 2, AG.WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT.CONTACT, 2, AG.WINDOW_ANIM_FRAME_START, 3);

		set_window_value(AT.CONTACT, 3, AG.WINDOW_TYPE, 1);
		set_window_value(AT.CONTACT, 3, AG.WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(AT.CONTACT, 3, AG.WINDOW_CUSTOM_FRICTION, 1);
		set_window_value(AT.CONTACT, 3, AG.WINDOW_LENGTH, 1);
		set_window_value(AT.CONTACT, 3, AG.WINDOW_ANIM_FRAMES, 3);
		set_window_value(AT.CONTACT, 3, AG.WINDOW_ANIM_FRAME_START, 6);
		
		set_num_hitboxes(AT.CONTACT, 1)
		
		set_hitbox_value(AT.CONTACT, 1, HG.HITBOX_TYPE, 1);
		set_hitbox_value(AT.CONTACT, 1, HG.WINDOW, 2);
		set_hitbox_value(AT.CONTACT, 1, HG.LIFETIME, 9999);
		set_hitbox_value(AT.CONTACT, 1, HG.HITBOX_FORW, 0);
		set_hitbox_value(AT.CONTACT, 1, HG.HITBOX_SIDE, -15);
		set_hitbox_value(AT.CONTACT, 1, HG.WIDTH, 25);
		set_hitbox_value(AT.CONTACT, 1, HG.HEIGHT, 25);
		set_hitbox_value(AT.CONTACT, 1, HG.DAMAGE, 1);
		set_hitbox_value(AT.CONTACT, 1, HG.KNOCKBACK, 300);
		set_hitbox_value(AT.CONTACT, 1, HG.SPEED, 0);
		set_hitbox_value(AT.CONTACT, 1, HG.HITSTUN, 14);
		
func _init():
	sap_slime_attack_data = SapSlimeAttackData.new()
	pumpkin_attack_data = PumpkinAttackData.new()
	gobbler_attack_data = GobblerAttackData.new()
	cactus_attack_data = CactusAttackData.new()
	moss_ske_attack_data = MossSkeletonAttackData.new()
	skeleton_attack_data = SkeletonAttackData.new()
	evil_oak_attack_data = EvilOakAttackData.new()
