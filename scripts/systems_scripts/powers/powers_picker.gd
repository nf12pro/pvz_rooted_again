extends Control

#region Variables
var powers_randomized: int = 0
var powers_randomized_1: int = 0
var powers_randomized_2: int = 0
var max_powers: int = 10
var banned_powers: Array = []
var generated: bool = false

var sunboost_scene = preload("res://scenes/systems/power_systems/sun_boost_power.tscn")
var peaboost_scene = preload("res://scenes/systems/power_systems/pea_boost_power.tscn")
var defenseboost_scene = preload("res://scenes/systems/power_systems/defense_boost_power.tscn")
var cooldownboost_scene = preload("res://scenes/systems/power_systems/cooldown_boost_power.tscn")

var twinsun_scene = preload("res://scenes/systems/power_systems/twin_sunflower_power.tscn")
var gatling_scene = preload("res://scenes/systems/power_systems/gatling_gun_power.tscn")
var frostpea_scene = preload("res://scenes/systems/power_systems/frost_pea_power.tscn")
var plasmapea_scene = preload("res://scenes/systems/power_systems/plasma_pea_power.tscn")
var plasmawood_scene = preload("res://scenes/systems/power_systems/plasma_wood_power.tscn")
var tallnut_scene = preload("res://scenes/systems/power_systems/tall_nut_power.tscn")
#endregion


func _process(_delta: float) -> void:
	if Global.pea_boost == 3:
		banned_powers.append(2)
	if Global.sun_boost == 3:
		banned_powers.append(1)
	if Global.defense_boost == 3:
		banned_powers.append(3)
	if Global.cooldown_boost == true:
		banned_powers.append(4)
	if Global.twin_sunflower_unlocked == true:
		banned_powers.append(5)
	if Global.gatling_gun_unlocked == true:
		banned_powers.append(6)
	if Global.frost_pea_unlocked == true:
		banned_powers.append(7)
	if Global.plasma_pea_unlocked == true:
		banned_powers.append(8)
	if Global.plasma_wood_unlocked == true:
		banned_powers.append(9)
	if Global.tall_nut_unlocked == true:
		banned_powers.append(10)
	
	if not generated:
		var all_powers: Array = []
		for i in range(1, max_powers + 1):
			if i not in banned_powers:
				all_powers.append(i)

		all_powers.shuffle()

		# Pick the first 3 unique powers
		powers_randomized = all_powers[0]
		powers_randomized_1 = all_powers[1]
		powers_randomized_2 = all_powers[2]

		print(powers_randomized)
		print(powers_randomized_1)
		print(powers_randomized_2)

		var sun_boost_power = sunboost_scene.instantiate()
		var pea_boost_power = peaboost_scene.instantiate()
		var defense_boost_power = defenseboost_scene.instantiate()
		var cooldown_boost_power = cooldownboost_scene.instantiate()
		var twin_sun_unlock = twinsun_scene.instantiate()
		var gatling_pea_unlock = gatling_scene.instantiate()
		var frost_pea_unlock = frostpea_scene.instantiate()
		var plasma_pea_unlock = plasmapea_scene.instantiate()
		var plasma_wood_unlock = plasmawood_scene.instantiate()
		var tall_nut_unlock = tallnut_scene.instantiate()

		#region Sun_Boost
		if powers_randomized == 1:
			sun_boost_power.position = Vector2(60, 100)
			get_tree().current_scene.call_deferred("add_child", sun_boost_power)
		elif powers_randomized_1 == 1:
			sun_boost_power.position = Vector2(450, 100)
			get_tree().current_scene.call_deferred("add_child", sun_boost_power)
		elif powers_randomized_2 == 1:
			sun_boost_power.position = Vector2(840, 100)
			get_tree().current_scene.call_deferred("add_child", sun_boost_power)
		#endregion

		#region Pea_Boost
		if powers_randomized == 2:
			pea_boost_power.position = Vector2(60, 100)
			get_tree().current_scene.call_deferred("add_child", pea_boost_power)
		elif powers_randomized_1 == 2:
			pea_boost_power.position = Vector2(450, 100)
			get_tree().current_scene.call_deferred("add_child", pea_boost_power)
		elif powers_randomized_2 == 2:
			pea_boost_power.position = Vector2(840, 100)
			get_tree().current_scene.call_deferred("add_child", pea_boost_power)
		#endregion

		#region Defense_Boost
		if powers_randomized == 3:
			defense_boost_power.position = Vector2(60, 100)
			get_tree().current_scene.call_deferred("add_child", defense_boost_power)
		elif powers_randomized_1 == 3:
			defense_boost_power.position = Vector2(450, 100)
			get_tree().current_scene.call_deferred("add_child", defense_boost_power)
		elif powers_randomized_2 == 3:
			defense_boost_power.position = Vector2(840, 100)
			get_tree().current_scene.call_deferred("add_child", defense_boost_power)
		#endregion

		#region Cooldown_Boost
		if powers_randomized == 4:
			cooldown_boost_power.position = Vector2(60, 100)
			get_tree().current_scene.call_deferred("add_child", cooldown_boost_power)
		elif powers_randomized_1 == 4:
			cooldown_boost_power.position = Vector2(450, 100)
			get_tree().current_scene.call_deferred("add_child", cooldown_boost_power)
		elif powers_randomized_2 == 4:
			cooldown_boost_power.position = Vector2(840, 100)
			get_tree().current_scene.call_deferred("add_child", cooldown_boost_power)
		#endregion
		
		#region Twin_Sunflower_Unlock
		if powers_randomized == 5:
			twin_sun_unlock.position = Vector2(60, 100)
			get_tree().current_scene.call_deferred("add_child", twin_sun_unlock)
		elif powers_randomized_1 == 5:
			twin_sun_unlock.position = Vector2(450, 100)
			get_tree().current_scene.call_deferred("add_child", twin_sun_unlock)
		elif powers_randomized_2 == 5:
			twin_sun_unlock.position = Vector2(840, 100)
			get_tree().current_scene.call_deferred("add_child", twin_sun_unlock)
		#endregion
		
		#region Gatling_Pea_Unlock
		if powers_randomized == 6:
			gatling_pea_unlock.position = Vector2(60, 100)
			get_tree().current_scene.call_deferred("add_child", gatling_pea_unlock)
		elif powers_randomized_1 == 6:
			gatling_pea_unlock.position = Vector2(450, 100)
			get_tree().current_scene.call_deferred("add_child", gatling_pea_unlock)
		elif powers_randomized_2 == 6:
			gatling_pea_unlock.position = Vector2(840, 100)
			get_tree().current_scene.call_deferred("add_child", gatling_pea_unlock)
		#endregion
		
		#region Frost_Pea_Unlock
		if powers_randomized == 7:
			frost_pea_unlock.position = Vector2(60, 100)
			get_tree().current_scene.call_deferred("add_child", frost_pea_unlock)
		elif powers_randomized_1 == 7:
			frost_pea_unlock.position = Vector2(450, 100)
			get_tree().current_scene.call_deferred("add_child", frost_pea_unlock)
		elif powers_randomized_2 == 7:
			frost_pea_unlock.position = Vector2(840, 100)
			get_tree().current_scene.call_deferred("add_child", frost_pea_unlock)
		#endregion
		
		#region Plasma_Pea_Unlock
		if powers_randomized == 8:
			plasma_pea_unlock.position = Vector2(60, 100)
			get_tree().current_scene.call_deferred("add_child", plasma_pea_unlock)
		elif powers_randomized_1 == 8:
			plasma_pea_unlock.position = Vector2(450, 100)
			get_tree().current_scene.call_deferred("add_child", plasma_pea_unlock)
		elif powers_randomized_2 == 8:
			plasma_pea_unlock.position = Vector2(840, 100)
			get_tree().current_scene.call_deferred("add_child", plasma_pea_unlock)
		#endregion
		
		#region Plasma_Wood_Unlock
		if powers_randomized == 9:
			plasma_wood_unlock.position = Vector2(60, 100)
			get_tree().current_scene.call_deferred("add_child", plasma_wood_unlock)
		elif powers_randomized_1 == 9:
			plasma_wood_unlock.position = Vector2(450, 100)
			get_tree().current_scene.call_deferred("add_child", plasma_wood_unlock)
		elif powers_randomized_2 == 9:
			plasma_wood_unlock.position = Vector2(840, 100)
			get_tree().current_scene.call_deferred("add_child", plasma_wood_unlock)
		#endregion
		
		#region Tall_Nut_Unlock
		if powers_randomized == 10:
			tall_nut_unlock.position = Vector2(60, 100)
			get_tree().current_scene.call_deferred("add_child", tall_nut_unlock)
		elif powers_randomized_1 == 10:
			tall_nut_unlock.position = Vector2(450, 100)
			get_tree().current_scene.call_deferred("add_child", tall_nut_unlock)
		elif powers_randomized_2 == 10:
			tall_nut_unlock.position = Vector2(840, 100)
			get_tree().current_scene.call_deferred("add_child", tall_nut_unlock)
		#endregion
		
		generated = true

	if Global.power_selected == true:
		await get_tree().create_timer(0.15).timeout
		if Global.current_level == 1:
			get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/ui/seed_picker.tscn")
