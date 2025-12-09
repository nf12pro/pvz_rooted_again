extends Control

#region Variables

func _ready() -> void:
	randomize()
	await get_tree().create_timer(5.0).timeout
	get_tree().change_scene_to_file("res://scenes/ui/start_menu.tscn")
	Global.game_over = false
#endregion

#region Game Over Scene
#endregion
