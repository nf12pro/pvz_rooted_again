extends Button

func _on_pressed() -> void:
	if Global.pea_boost < 3:
		Global.pea_boost += 1
		Global.power_selected = true
	elif Global.pea_boost == 3:
		print("MAX BOOST ACHIEVED")
