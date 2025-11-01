extends Node2D

#region Variables
var peashooter_scene = preload("res://scenes/plants/world_1_basic/plant_seeds/peashooter_seed.tscn")  
var sunflower_scene = preload("res://scenes/plants/world_1_basic/plant_seeds/sunflower_seed.tscn")
var gatling_gun_scene = preload("res://scenes/plants/world_1_basic/plant_seeds/gatling_gun_seed.tscn")
var repeater_scene = preload("res://scenes/plants/world_1_basic/plant_seeds/repeater_seed_1.tscn")
var twin_scene = preload("res://scenes/plants/world_1_basic/plant_seeds/twin_sunflower_seed.tscn")
var wallnut_scene = preload("res://scenes/plants/world_1_basic/plant_seeds/wallnut_seed.tscn")
var torchwood_scene = preload("res://scenes/plants/world_1_basic/plant_seeds/torchwood_seed.tscn")
var plasmawood_scene = preload("res://scenes/plants/world_1_basic/plant_seeds/plasma_wood_seed.tscn")
var cherrybomb_scene = preload("res://scenes/plants/world_1_basic/plant_seeds/cherrybomb_seed.tscn")
var laserbean_scene = preload("res://scenes/plants/world_1_basic/plant_seeds/laser_bean_seed.tscn")
var tallnut_scene = preload("res://scenes/plants/world_1_basic/plant_seeds/tallnut_seed.tscn")
var iceberg_scene = preload("res://scenes/plants/world_1_basic/plant_seeds/iceberg_lettuce_seed.tscn")
var doomshroom_scene = preload("res://scenes/plants/world_1_basic/plant_seeds/doomshroom_seed.tscn")
var plasmapea_scene = preload("res://scenes/plants/world_1_basic/plant_seeds/plasma_pea_seed.tscn")
var snowpea_scene = preload("res://scenes/plants/world_1_basic/plant_seeds/ice_peashooter_seed.tscn")
#endregion

#region Pick Seed / Spawn Timer
func _ready() -> void:
	var peashooter_seed = peashooter_scene.instantiate()
	var sunflower_seed = sunflower_scene.instantiate() 
	var gatling_gun_seed = gatling_gun_scene.instantiate()
	var repeater_seed = repeater_scene.instantiate()
	var twin_seed = twin_scene.instantiate()
	var wallnut_seed = wallnut_scene.instantiate()
	var torchwood_seed = torchwood_scene.instantiate()
	var plasma_wood_seed = plasmawood_scene.instantiate()
	var cherry_bomb_seed = cherrybomb_scene.instantiate()
	var laser_bean_seed = laserbean_scene.instantiate()
	var tallnut_seed = tallnut_scene.instantiate()
	var iceberg_lettuce_seed = iceberg_scene.instantiate()
	var doomshroom_seed = doomshroom_scene.instantiate()
	var plasma_pea_seed = plasmapea_scene.instantiate()
	var snow_pea_seed = snowpea_scene.instantiate()
	if Global.seed_6 == "Peashooter":
		peashooter_seed.position = Vector2(820, 55)
		get_tree().current_scene.call_deferred("add_child", peashooter_seed)
	elif Global.seed_6 == "Sunflower":
		sunflower_seed.position = Vector2(820, 55)
		get_tree().current_scene.call_deferred("add_child", sunflower_seed)
	elif Global.seed_6 == "Gatling Gun":
		gatling_gun_seed.position = Vector2(820, 55)
		get_tree().current_scene.call_deferred("add_child", gatling_gun_seed)
	elif Global.seed_6 == "Repeater":
		repeater_seed.position = Vector2(820, 55)
		get_tree().current_scene.call_deferred("add_child", repeater_seed)
	elif Global.seed_6 == "WallNut":
		wallnut_seed.position = Vector2(820, 55)
		get_tree().current_scene.call_deferred("add_child", wallnut_seed)
	elif Global.seed_6 == "Twin Sunflower":
		twin_seed.position = Vector2(820, 55)
		get_tree().current_scene.call_deferred("add_child", twin_seed)
	elif Global.seed_6 == "Torchwood":
		torchwood_seed.position = Vector2(820, 55)
		get_tree().current_scene.call_deferred("add_child", torchwood_seed)
	elif Global.seed_6 == "Plasma Wood":
		plasma_wood_seed.position = Vector2(820, 55)
		get_tree().current_scene.call_deferred("add_child", plasma_wood_seed)
	elif Global.seed_6 == "Cherry Bomb":
		cherry_bomb_seed.position = Vector2(820, 55)
		get_tree().current_scene.call_deferred("add_child", cherry_bomb_seed)
	elif Global.seed_6 == "Laser Bean":
		laser_bean_seed.position = Vector2(820, 55)
		get_tree().current_scene.call_deferred("add_child", laser_bean_seed)
	elif Global.seed_6 == "Tall Nut":
		tallnut_seed.position = Vector2(820, 55)
		get_tree().current_scene.call_deferred("add_child", tallnut_seed)
	elif Global.seed_6 == "Iceberg Lettuce":
		iceberg_lettuce_seed.position = Vector2(820, 55)
		get_tree().current_scene.call_deferred("add_child", iceberg_lettuce_seed)
	elif Global.seed_6 == "Doom Shroom":
		doomshroom_seed.position = Vector2(820, 55)
		get_tree().current_scene.call_deferred("add_child", doomshroom_seed)
	elif Global.seed_6 == "Plasma Pea":
		plasma_pea_seed.position = Vector2(820, 55)
		get_tree().current_scene.call_deferred("add_child", plasma_pea_seed)
	elif Global.seed_6 == "Snow Pea":
		snow_pea_seed.position = Vector2(820, 55)
		get_tree().current_scene.call_deferred("add_child", snow_pea_seed)
#endregion
