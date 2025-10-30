extends Node2D

#region Variables
var zombie_scene = preload("res://scenes/zombies/basic_zombie.tscn")  # Your zombie prefab
var conehead_zombie_scene = preload("res://scenes/zombies/conehead_zombie.tscn")
var buckethead_zombie_scene = preload("res://scenes/zombies/bucket_head_zombie.tscn")
var level_label = preload("res://scenes/ui/level_clear/level_1_clear.tscn")

var base_spawn_interval: float = 5.0 
var min_spawn_interval: float = 0.5
var spawn_timer: float = 0.0
var type_zombie: int = 0
#endregion

#region Spawn Timer

func _process(delta):
	spawn_timer += delta
	var score_factor = Global.score / 100.0  # adjust denominator to control scaling
	var spawn_interval = max(base_spawn_interval - score_factor, min_spawn_interval)
	
	if spawn_timer >= spawn_interval:
		choose_zombie()
		spawn_timer = 0.0
#endregion
#region Choose Zombie
func choose_zombie():
	var zombie = zombie_scene.instantiate()
	var conehead_zombie = conehead_zombie_scene.instantiate()
	var buckethead_zombie = buckethead_zombie_scene.instantiate()
	if Global.score < 100:
		var type_zombie = randi() % 2 + 1
		if type_zombie == 1:
			spawn_zombie()
		elif type_zombie == 2:
			spawn_conehead_zombie()
	elif Global.score > 100 and Global.score < 300:
		var type_zombie = randi() % 3 + 2
		if type_zombie == 1:
			spawn_zombie()
		elif type_zombie == 2:
			spawn_conehead_zombie()
		elif type_zombie == 3:
			spawn_buckethead_zombie()
	


#endregion

#region Spawn Zombie
func spawn_zombie():
	var type_zombie = randi() % 2 + 1
	var zombie = zombie_scene.instantiate()
	var lane = randi() % 5 + 1 
	if lane == 1:
		zombie.position = Vector2(1200, 150)
		get_parent().add_child(zombie)
	elif lane == 2:
		zombie.position = Vector2(1200, 250)
		get_parent().add_child(zombie)
	elif lane == 3:
		zombie.position = Vector2(1200, 350)
		get_parent().add_child(zombie)
	elif lane == 4:
		zombie.position = Vector2(1200, 450)
		get_parent().add_child(zombie)
	elif lane == 5:
		zombie.position = Vector2(1200, 550)
		get_parent().add_child(zombie)
#endregion

#region Spawn Conehead Zombie
func spawn_conehead_zombie():
	var conehead_zombie = conehead_zombie_scene.instantiate()
	var lane = randi() % 5 + 1 
	if lane == 1:
		conehead_zombie.position = Vector2(1200, 150)
		get_parent().add_child(conehead_zombie)
	elif lane == 2:
		conehead_zombie.position = Vector2(1200, 250)
		get_parent().add_child(conehead_zombie)
	elif lane == 3:
		conehead_zombie.position = Vector2(1200, 350)
		get_parent().add_child(conehead_zombie)
	elif lane == 4:
		conehead_zombie.position = Vector2(1200, 450)
		get_parent().add_child(conehead_zombie)
	elif lane == 5:
		conehead_zombie.position = Vector2(1200, 550)
		get_parent().add_child(conehead_zombie)
#endregion

#region Spawn Buckethead Zombie
func spawn_buckethead_zombie():
	var buckethead_zombie = buckethead_zombie_scene.instantiate()
	
	var lane = randi() % 5 + 1 
	if lane == 1:
		buckethead_zombie.position = Vector2(1200, 150)
		get_parent().add_child(buckethead_zombie)
	elif lane == 2:
		buckethead_zombie.position = Vector2(1200, 250)
		get_parent().add_child(buckethead_zombie)
	elif lane == 3:
		buckethead_zombie.position = Vector2(1200, 350)
		get_parent().add_child(buckethead_zombie)
	elif lane == 4:
		buckethead_zombie.position = Vector2(1200, 450)
		get_parent().add_child(buckethead_zombie)
	elif lane == 5:
		buckethead_zombie.position = Vector2(1200, 550)
		get_parent().add_child(buckethead_zombie)
#endregion
