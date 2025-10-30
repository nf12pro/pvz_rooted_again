extends Node2D
	
func _unhandled_input(event: InputEvent) -> void:
	if Global.current_level == 4:
		get_tree().change_scene_to_file("res://scenes/ui/seed_picker.tscn")
		Global.plasma_wood_unlocked = true
		Global.score = 0
