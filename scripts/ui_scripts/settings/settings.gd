extends Control

@onready var language_drop_down: OptionButton = $MarginContainer/VBoxContainer/LanguageButton
func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("Space") or Input.is_action_just_pressed("A"):
		get_tree().change_scene_to_file("res://scenes/ui/start_menu.tscn")

func _on_language_selected(index: int) -> void:
	var language = language_drop_down.get_item_text(index)
	TranslationServer.set_locale(language)
