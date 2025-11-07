extends Node2D
	
func _unhandled_input(_event: InputEvent) -> void:
	if Global.current_level == 2:
		Engine.time_scale = 1.0   # Doubles game speed
		get_tree().change_scene_to_file("res://scenes/systems/power_systems/powers_picker.tscn")
		Global.spawn_score = 0
