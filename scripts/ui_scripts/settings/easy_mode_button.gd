extends Button

var a_pressed = false

func _ready() -> void:
	if Global.easy_mode:
		text = "EASY MODE ON"
	else:
		text = "EASY MODE OFF"

func _on_easy_pressed() -> void:
	if a_pressed == false:
		Global.easy_mode = true
		text = "EASY MODE ON"
		a_pressed = true
	else:
		Global.easy_mode = false
		text = "EASY MODE OFF"
		a_pressed = false
