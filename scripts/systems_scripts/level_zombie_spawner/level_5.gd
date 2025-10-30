extends Node2D
	
func _unhandled_input(event: InputEvent) -> void:
	if Global.current_level == 6:
		if Global.mower_used == false:
			Global.mower_not_used_achievement = true
		
		get_tree().change_scene_to_file("res://scenes/ui/game_won.tscn")

		
