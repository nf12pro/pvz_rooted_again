extends Node2D
	
func _unhandled_input(_event: InputEvent) -> void:
	if Global.current_level == 4:
		Global.reset_seeds()
		get_tree().change_scene_to_file("res://scenes/systems/power_systems/powers_picker.tscn")
		Global.score = 0
