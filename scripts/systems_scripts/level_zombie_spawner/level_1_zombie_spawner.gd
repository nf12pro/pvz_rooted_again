extends Node2D

#region Variables
var zombie_scene = preload("res://scenes/zombies/basic_zombie.tscn")
var conehead_zombie_scene = preload("res://scenes/zombies/conehead_zombie.tscn")
var buckethead_zombie_scene = preload("res://scenes/zombies/bucket_head_zombie.tscn")
var allstar_zombie_scene = preload("res://scenes/zombies/allstar_zombie.tscn")
var level_clear = preload("res://scenes/ui/level_clear/level_1_clear.tscn")

var base_min_interval: float = 1.5  # Shortest delay
var base_max_interval: float = 4.0  # Longest delay
var current_interval: float = 0.0
var spawn_timer: float = 0.0
var level_cleared: bool = false
#endregion


func _ready():
	randomize()
	await get_tree().create_timer(1.5).timeout
	_set_new_random_interval()


func _process(delta):
	# Stop processing if the current level doesn't exist
	if not Global.level_data.has(Global.current_level):
		return

	# Stop spawning if level is already cleared
	if level_cleared:
		return

	spawn_timer += delta
	var _data = Global.level_data[Global.current_level]

	# Check if all zombies for this level are gone
	check_zombie()

	# Spawn a new zombie if timer reached the current interval
	if spawn_timer >= current_interval:
		choose_zombie()
		spawn_timer = 0.0
		_set_new_random_interval()


#region Spawn Logic
func _set_new_random_interval():
	var score_factor = clamp(Global.score / 300.0, 0.0, 1.0)
	var starting_boost = 5.0

	var min_interval = lerp(base_max_interval + starting_boost, base_min_interval, score_factor)
	var max_interval = lerp(base_max_interval + 2.0 + starting_boost, base_min_interval + 0.5, score_factor)

	current_interval = randf_range(min_interval, max_interval)
#endregion


#region Choose Zombie
func choose_zombie():
	var data = Global.level_data[Global.current_level]
	var options = []

	if data["zombies"] > 0:
		options.append("zombie")
	if data["coneheads"] > 0:
		options.append("conehead")
	if data["bucketheads"] > 0:
		options.append("buckethead")
	if data["allstars"] > 0:
		options.append("allstar")

	if options.size() == 0:
		return

	var choice = options[randi() % options.size()]

	match choice:
		"zombie":
			spawn_zombie()
			data["zombies"] -= 1
		"conehead":
			spawn_conehead_zombie()
			data["coneheads"] -= 1
		"buckethead":
			spawn_buckethead_zombie()
			data["bucketheads"] -= 1
		"allstar":
			spawn_allstar_zombie()
			data["allstars"] -= 1
#endregion


#region Spawning
func spawn_zombie():
	var zombie = zombie_scene.instantiate()
	zombie.position = choose_lane()
	get_parent().add_child(zombie)
	zombie.add_to_group("Zombie")

func spawn_conehead_zombie():
	var conehead_zombie = conehead_zombie_scene.instantiate()
	conehead_zombie.position = choose_lane()
	get_parent().add_child(conehead_zombie)
	conehead_zombie.add_to_group("Zombie")

func spawn_buckethead_zombie():
	var buckethead_zombie = buckethead_zombie_scene.instantiate()
	buckethead_zombie.position = choose_lane()
	get_parent().add_child(buckethead_zombie)
	buckethead_zombie.add_to_group("Zombie")

func spawn_allstar_zombie():
	var allstar_zombie = allstar_zombie_scene.instantiate()
	allstar_zombie.position = choose_lane()
	get_parent().add_child(allstar_zombie)
	allstar_zombie.add_to_group("Zombie")
#endregion


#region Game Clear
func check_zombie():
	var data = Global.level_data[Global.current_level]

	if data["zombies"] + data["coneheads"] + data["bucketheads"] <= 0:
		if get_tree().get_nodes_in_group("Zombie").size() == 0:
			level_cleared = true
			show_level_clear()
			await get_tree().create_timer(1.0).timeout

			# Move to next level if it exists
			Global.current_level += 1
			level_cleared = false

			# If next level doesn't exist, stop everything
			if not Global.level_data.has(Global.current_level):
				print("All levels completed!")
				return
#endregion


#region Level Clear UI
func show_level_clear():
	var label = level_clear.instantiate()
	get_parent().add_child(label)
	label.position = Vector2(640, 360)  # Center on screen
#endregion


#region Lane Choice
func choose_lane() -> Vector2:
	var lane = randi() % 5 + 1
	match lane:
		1: return Vector2(1200, 150)
		2: return Vector2(1200, 250)
		3: return Vector2(1200, 350)
		4: return Vector2(1200, 450)
		5: return Vector2(1200, 550)
	return Vector2(1200, 350)
#endregion
