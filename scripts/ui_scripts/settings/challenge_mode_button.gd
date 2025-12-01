extends Button

var a_pressed = false

func _ready() -> void:
	if not Global.challenge_mode_unlocked:
		queue_free()
	if Global.challenge_mode:
		text = "HARD MODE ON"
	else:
		text = "HARD MODE OFF"

func _on_easy_pressed() -> void:
	if a_pressed == false:
		Global.challenge_mode = true
		text = "HARD MODE ON"
		a_pressed = true
	else:
		Global.challenge_mode = false
		text = "HARD MODE OFF"
		a_pressed = false
