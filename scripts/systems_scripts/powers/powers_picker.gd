extends Control

#region Variables
var powers_randomized: int = 0
var powers_randomized_1: int = 0
var powers_randomized_2: int = 0
var max_powers: int = 10
var banned_powers: Array = []
var generated: bool = false
var reroll: bool = false
var spawned_powers: Array = [] # Track instantiated powers for deletion

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
	roll_power()

func roll_power():
	if reroll:
		for node in spawned_powers:
			if node.is_inside_tree():
				node.queue_free()
		spawned_powers.clear()
		reroll = false

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

		var powers_list = [
			[sun_boost_power, 1],
			[pea_boost_power, 2],
			[defense_boost_power, 3],
			[cooldown_boost_power, 4],
			[twin_sun_unlock, 5],
			[gatling_pea_unlock, 6],
			[frost_pea_unlock, 7],
			[plasma_pea_unlock, 8],
			[plasma_wood_unlock, 9],
			[tall_nut_unlock, 10]
		]

		for power in powers_list:
			var node = power[0]
			var value = power[1]

			if powers_randomized == value:
				node.position = Vector2(60, 100)
				get_tree().current_scene.call_deferred("add_child", node)
				spawned_powers.append(node)
			elif powers_randomized_1 == value:
				node.position = Vector2(450, 100)
				get_tree().current_scene.call_deferred("add_child", node)
				spawned_powers.append(node)
			elif powers_randomized_2 == value:
				node.position = Vector2(840, 100)
				get_tree().current_scene.call_deferred("add_child", node)
				spawned_powers.append(node)

		generated = true

	if Global.power_selected == true:
		Global.power_selected = false
		await get_tree().create_timer(0.15).timeout
		if Global.endless_mode:
			get_tree().change_scene_to_file("res://scenes/ui/seed_picker.tscn")
		elif not Global.challenge_mode:
			if Global.current_level == 1:
				get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")
			else:
				get_tree().change_scene_to_file("res://scenes/ui/seed_picker.tscn")

func _on_reroll_button_pressed() -> void:
	if Global.score >= 100:
		Global.score -= 100
		reroll = true
		generated = false
