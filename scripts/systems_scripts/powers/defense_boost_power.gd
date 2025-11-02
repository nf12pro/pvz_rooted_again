extends Button

func _on_pressed() -> void:
	if Global.defense_boost < 3:
		Global.defense_boost += 1
		Global.power_selected = true
	elif Global.defense_boost == 3:
		print("MAX BOOST ACHIEVED")
