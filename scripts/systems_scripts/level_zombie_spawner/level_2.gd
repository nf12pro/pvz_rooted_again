extends Node2D
	
func _unhandled_input(_event: InputEvent) -> void:
	if Global.current_level == 3:
		get_tree().change_scene_to_file("res://scenes/ui/seed_picker.tscn")
		Global.tall_nut_unlocked = true
		Global.score = 0
