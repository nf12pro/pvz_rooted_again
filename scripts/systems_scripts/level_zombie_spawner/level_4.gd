extends Node2D
	
func _unhandled_input(event: InputEvent) -> void:
	if Global.current_level == 5:
		get_tree().change_scene_to_file("res://scenes/ui/seed_picker.tscn")
		Global.gatling_gun_unlocked = true
		Global.score = 0
