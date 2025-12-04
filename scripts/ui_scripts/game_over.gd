extends Control

#region Variables

func _ready() -> void:
	randomize()
#endregion

#region Game Over Scene
func _unhandled_key_input(_event: InputEvent) -> void:
	get_tree().change_scene_to_file("res://scenes/ui/start_menu.tscn")
	Global.game_over = false
#endregion
