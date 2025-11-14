extends Node2D
	
func _process(_delta: float) -> void:
	if Global.current_level >= 6:
		Global.reset_seeds()
		Engine.time_scale = 1.0  
		if Global.mowers_nerf == true:
			Global.mower_not_used_achievement = true
		get_tree().change_scene_to_file("res://scenes/ui/game_won.tscn")
