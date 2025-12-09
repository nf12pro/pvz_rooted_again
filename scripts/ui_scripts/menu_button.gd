extends Control

var tutorial_popup_scene = preload("res://scenes/ui/tutorial_popup.tscn")

@onready var start_button = $MarginContainer/VBoxContainer/Start_Button
@onready var endless_button = $MarginContainer/VBoxContainer/Endless_Button
@onready var settings_button = $MarginContainer/VBoxContainer/Settings

func start_on_pressed() -> void:
	var tutorial_popup = tutorial_popup_scene.instantiate()
	if Global.first_time_play:
		get_parent().add_child(tutorial_popup)
		Global.adventure_picked_skip = true

	else:
		get_tree().change_scene_to_file("res://scenes/ui/seed_picker.tscn")


func _on_seed_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/settings/settings.tscn")

func endless_on_pressed() -> void:
	var tutorial_popup = tutorial_popup_scene.instantiate()
	if Global.first_time_play:
		get_parent().add_child(tutorial_popup)
		Global.endless_picked_skip = true
	else:
		Global.endless_mode = true
		get_tree().change_scene_to_file("res://scenes/ui/seed_picker.tscn")

func _process(_delta):
	if Global.tutorial_pop_up_screen:
		start_button.visible = false
		endless_button.visible = false
		settings_button.visible = false
	else:
		start_button.visible = true
		endless_button.visible = true
		settings_button.visible = true
