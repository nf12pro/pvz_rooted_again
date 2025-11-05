extends Area2D

#region Variables
#endregion


#region Layer Settings
func layer_setting():
	collision_layer = 3
	collision_mask = 1
#endregion


#region Detect House Collision
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Zombie"):
		if body.has_method("take_damage"):
			if Global.game_over == false:
				call_deferred("_trigger_game_over")
#endregion


func _trigger_game_over():
	get_tree().change_scene_to_file("res://scenes/ui/game_over.tscn")
	Global.game_over = true
