extends Control

func _ready() -> void:
	Global.tutorial_pop_up_screen = true

func _on_skip_pressed() -> void:
	Global.first_time_play = false
	Global.tutorial_pop_up_screen = false
	if Global.adventure_picked_skip:
		get_tree().change_scene_to_file("res://scenes/ui/seed_picker.tscn")
	elif Global.endless_picked_skip:
		Global.endless_mode = true
		get_tree().change_scene_to_file("res://scenes/ui/seed_picker.tscn")
	queue_free()

func _on_play_pressed() -> void:
	Global.tutorial_pop_up_screen = false
	Global.tutorial_mode = true
	get_tree().change_scene_to_file("res://scenes/levels/tutorial_level.tscn")
	queue_free()
