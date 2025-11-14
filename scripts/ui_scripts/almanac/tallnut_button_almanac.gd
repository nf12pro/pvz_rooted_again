extends Button

#region peashooter Picking
func _on_peashooter_picker_pressed() -> void:
		get_tree().change_scene_to_file("res://scenes/plants/almanac/almanac_descriptions/almanac_tallnut.tscn")
#endregion

func _ready() -> void:
	if not Global.tall_nut_unlocked:
		queue_free()
