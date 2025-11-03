extends Button

var a_pressed: bool = false

func _on_pressed() -> void:
	if a_pressed == false:
		Global.mowers_nerf = true
		text = "MOWERS OFF"
		a_pressed = true
	else:
		Global.mowers_nerf = false
		text = "MOWERS ON"
		a_pressed = false
