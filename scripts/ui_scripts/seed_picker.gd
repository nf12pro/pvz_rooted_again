extends Control

var life_time = 2.75
var plasma_pea_error = preload("res://scenes/ui/labels/plasma_pea_upgrade_error.tscn")
var twin_sunflower_error = preload("res://scenes/ui/labels/twin_sunflower_upgrade_error.tscn")
var plasma_wood_error = preload("res://scenes/ui/labels/plasma_wood_upgrade_error.tscn")

func _unhandled_key_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("Space"):
		var plasma_pea_label = plasma_pea_error.instantiate()
		var twin_sunflower_label = twin_sunflower_error.instantiate()
		var plasma_wood_label = plasma_wood_error.instantiate()
		if (Global.plasma_pea_selected and not Global.peashooter_selected) \
		or (Global.twin_sunflower_selected and not Global.sunflower_selected) \
		or (Global.plasma_wood_selected and not Global.torchwood_selected):
			#region Plasma Pea Error
			if Global.plasma_pea_selected == true and Global.peashooter_selected == false:
				get_parent().add_child(plasma_pea_label)
				plasma_pea_label.position = Vector2(50, 360) 
				var tween = create_tween()
				tween.tween_property(plasma_pea_label, "modulate:a", 0.0, life_time) # fade to 0 alpha over 0.5s
				tween.set_trans(Tween.TRANS_SINE)
				tween.set_ease(Tween.EASE_IN_OUT)
				await get_tree().create_timer(life_time).timeout
				plasma_pea_label.queue_free()
			#endregion
			#region Twin Sunflower Error
			if Global.twin_sunflower_selected == true and Global.sunflower_selected == false:
				get_parent().add_child(twin_sunflower_label)
				twin_sunflower_label.position = Vector2(50, 360) 
				var tween = create_tween()
				tween.tween_property(twin_sunflower_label, "modulate:a", 0.0, life_time) # fade to 0 alpha over 0.5s
				tween.set_trans(Tween.TRANS_SINE)
				tween.set_ease(Tween.EASE_IN_OUT)
				await get_tree().create_timer(life_time).timeout
				twin_sunflower_label.queue_free()
			#endregion
			#region Plasma Wood Error
			if Global.plasma_wood_selected == true and Global.torchwood_selected == false:
				get_parent().add_child(plasma_wood_label)
				plasma_wood_label.position = Vector2(50, 360)
		#endregion
		else:

			if Global.current_level == 1:
				get_tree().change_scene_to_file("res://scenes/systems/power_systems/powers_picker.tscn")
			elif Global.current_level == 2:
				get_tree().change_scene_to_file("res://scenes/levels/level_2.tscn")
			elif Global.current_level == 3:
				get_tree().change_scene_to_file("res://scenes/levels/level_3.tscn")
			elif Global.current_level == 4:
				get_tree().change_scene_to_file("res://scenes/levels/level_4.tscn")
			elif Global.current_level == 5:
				get_tree().change_scene_to_file("res://scenes/levels/level_5.tscn")
