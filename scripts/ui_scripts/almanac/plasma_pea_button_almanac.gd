extends Button

#region peashooter Picking
func _on_peashooter_picker_pressed() -> void:
		get_tree().change_scene_to_file("res://scenes/plants/almanac/almanac_descriptions/almanac_plasma_pea.tscn")
#endregion

func _ready() -> void:
	if not Global.plasma_pea_unlocked:
		queue_free()
