extends Control

func _unhandled_key_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("Space"):
		if Global.current_level == 1:
			get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")
		elif Global.current_level == 2:
			get_tree().change_scene_to_file("res://scenes/levels/level_2.tscn")
		elif Global.current_level == 3:
			get_tree().change_scene_to_file("res://scenes/levels/level_3.tscn")
		elif Global.current_level == 4:
			get_tree().change_scene_to_file("res://scenes/levels/level_4.tscn")
		elif Global.current_level == 5:
			get_tree().change_scene_to_file("res://scenes/levels/level_5.tscn")
