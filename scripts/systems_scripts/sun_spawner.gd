extends Node2D


#region Variables
var sun_scene = preload("res://scenes/plants/projectiles/sun_spawned.tscn")
var plant_hp = 300
var produce_timer = 0.0
var square: Node = null
#endregion


#region Sun Production
func _process(delta):
	var produce_interval = randi() % 15 + 20 
	produce_timer += delta
	if produce_timer >= produce_interval:
		produce_sun()
		produce_timer = 0.0
		produce_interval = randi() % 15 + 20 

func produce_sun():
	var sun = sun_scene.instantiate()
	sun.position = global_position + Vector2(0, -20) # slightly above the flower
	get_parent().add_child(sun)
	Global.sun_value += 25
#endregion
