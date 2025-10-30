extends Button

func _on_change_page_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/plants/almanac/almanac_page_2.tscn")
