extends Node2D
	
func _unhandled_input(_event: InputEvent) -> void:
	if Global.current_level == 2:
		get_tree().change_scene_to_file("res://scenes/ui/seed_picker.tscn")
		Global.score = 0
		Global.twin_sunflower_unlocked = true
