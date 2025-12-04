extends Node2D


func _process(_delta: float) -> void:
	if Global.endless_stage not in Global.endless_stage_cleared:
		Global.endless_stage_cleared.append(Global.endless_stage)
		Engine.time_scale = 1.0  
		print("changed Endless")
		get_tree().change_scene_to_file("res://scenes/systems/power_systems/powers_picker.tscn")
		if Global.challenge_mode:
			if Global.sun_value >= 200:
				Global.sun_value = 200
