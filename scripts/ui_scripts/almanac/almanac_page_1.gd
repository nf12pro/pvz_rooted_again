extends Control

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("Space"):
		get_tree().change_scene_to_file("res://scenes/ui/start_menu.tscn")
