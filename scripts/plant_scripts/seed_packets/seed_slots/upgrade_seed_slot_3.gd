extends Node2D

#region Variables
var gatling_gun_scene = preload("res://scenes/plants/world_1_basic/plant_seeds/gatling_gun_seed.tscn")
var twin_scene = preload("res://scenes/plants/world_1_basic/plant_seeds/twin_sunflower_seed.tscn")
var plasmawood_scene = preload("res://scenes/plants/world_1_basic/plant_seeds/plasma_wood_seed.tscn")
var tallnut_scene = preload("res://scenes/plants/world_1_basic/plant_seeds/tallnut_seed.tscn")
var plasmapea_scene = preload("res://scenes/plants/world_1_basic/plant_seeds/plasma_pea_seed.tscn")
var frostpea_scene = preload("res://scenes/plants/world_1_basic/plant_seeds/frost_pea_seed.tscn")
#endregion

#region Pick Seed / Spawn Timer

func _ready() -> void:
	var gatling_gun_seed = gatling_gun_scene.instantiate()
	var twin_seed = twin_scene.instantiate()
	var plasma_wood_seed = plasmawood_scene.instantiate()
	var tallnut_seed = tallnut_scene.instantiate()
	var plasma_pea_seed = plasmapea_scene.instantiate()
	var frost_pea_seed = frostpea_scene.instantiate()
	if Global.upgrade_seed_3 == "Gatling Gun":
		gatling_gun_seed.position = Vector2(940, 55)
		get_tree().current_scene.call_deferred("add_child", gatling_gun_seed)
	elif Global.upgrade_seed_3 == "Twin Sunflower":
		twin_seed.position = Vector2(940, 55)
		get_tree().current_scene.call_deferred("add_child", twin_seed)
	elif Global.upgrade_seed_3 == "Plasma Wood":
		plasma_wood_seed.position = Vector2(940, 55)
		get_tree().current_scene.call_deferred("add_child", plasma_wood_seed)
	elif Global.upgrade_seed_3 == "Tall Nut":
		tallnut_seed.position = Vector2(940, 55)
		get_tree().current_scene.call_deferred("add_child", tallnut_seed)
	elif Global.upgrade_seed_3 == "Plasma Pea":
		plasma_pea_seed.position = Vector2(940, 55)
		get_tree().current_scene.call_deferred("add_child", plasma_pea_seed)
	elif Global.upgrade_seed_3 == "Frost Pea":
		frost_pea_seed.position = Vector2(940, 55)
		get_tree().current_scene.call_deferred("add_child", frost_pea_seed)
#endregion
