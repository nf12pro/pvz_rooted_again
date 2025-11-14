extends Node2D
	
func _process(_delta: float) -> void:
	if Global.current_level == 4:
		Engine.time_scale = 1.0   # Doubles game speed
		get_tree().change_scene_to_file("res://scenes/systems/power_systems/powers_picker.tscn")
		Global.spawn_score = 0
