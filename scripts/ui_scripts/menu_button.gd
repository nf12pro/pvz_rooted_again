extends Button

func _ready() -> void:
	print("WHTY")

func start_on_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/seed_picker.tscn")


func _on_seed_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/settings/settings.tscn")


func endless_on_pressed() -> void:
	Global.endless_mode = true
	get_tree().change_scene_to_file("res://scenes/ui/seed_picker.tscn")
