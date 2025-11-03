extends Control

#region Variables
var powers_randomized: int = 0
var powers_randomized_1: int = 0
var powers_randomized_2: int = 0
var max_powers: int = 5
var banned_powers: Array = []
var generated: bool = false

var sunboost_scene = preload("res://scenes/systems/power_systems/sun_boost_power.tscn")
var peaboost_scene = preload("res://scenes/systems/power_systems/pea_boost_power.tscn")
var defenseboost_scene = preload("res://scenes/systems/power_systems/defense_boost_power.tscn")
var cooldownboost_scene = preload("res://scenes/systems/power_systems/cooldown_boost_power.tscn")
var twinsun_scene = preload("res://scenes/systems/power_systems/twin_sunflower_power.tscn")
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
		
		generated = true

	if Global.power_selected == true:
		await get_tree().create_timer(0.15).timeout
		if Global.current_level == 1:
			get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/ui/seed_picker.tscn")
