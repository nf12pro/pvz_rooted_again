extends Node2D

var endless_stage_cleared: Array = []

func _process(_delta: float) -> void:
	for i in range(Global.endless_stage):
		if i not in endless_stage_cleared:
			endless_stage_cleared.append(Global.endless_stage)
			Engine.time_scale = 1.0  
			print("changed Endless")
			get_tree().change_scene_to_file("res://scenes/systems/power_systems/powers_picker.tscn")
			if Global.challenge_mode:
				if Global.sun_value >= 200:
					Global.sun_value = 200
