extends Control

var life_time = 2.75
var plasma_pea_error = preload("res://scenes/ui/labels/plasma_pea_upgrade_error.tscn")
var twin_sunflower_error = preload("res://scenes/ui/labels/twin_sunflower_upgrade_error.tscn")
var plasma_wood_error = preload("res://scenes/ui/labels/plasma_wood_upgrade_error.tscn")
var frost_pea_error = preload("res://scenes/ui/labels/frost_pea_upgrade_error.tscn")
var gatling_pea_error = preload("res://scenes/ui/labels/gatling_pea_upgrade_error.tscn")
var tall_nut_error = preload("res://scenes/ui/labels/tall_nut_upgrade_error.tscn")

#region Checking Labels + Next Stage
func _unhandled_key_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("Space"):
		var plasma_pea_label = plasma_pea_error.instantiate()
		var twin_sunflower_label = twin_sunflower_error.instantiate()
		var plasma_wood_label = plasma_wood_error.instantiate()
		var frost_pea_label = frost_pea_error.instantiate()
		var gatling_pea_label = gatling_pea_error.instantiate()
		var tall_nut_label = tall_nut_error.instantiate()
		if (Global.plasma_pea_selected and not Global.peashooter_selected) \
		or (Global.twin_sunflower_selected and not Global.sunflower_selected) \
		or (Global.plasma_wood_selected and not Global.torchwood_selected) \
		or (Global.frost_pea_selected and not Global.snow_pea_selected) \
		or (Global.gatling_gun_selected and not Global.repeater_selected) \
		or (Global.tall_nut_selected and not Global.wallnut_selected):
			#region Plasma Pea Error
			if Global.plasma_pea_selected == true and Global.peashooter_selected == false:
				get_parent().add_child(plasma_pea_label)
				plasma_pea_label.position = Vector2(50, 360) 
			#endregion
			#region Twin Sunflower Error
			elif Global.twin_sunflower_selected == true and Global.sunflower_selected == false:
				get_parent().add_child(twin_sunflower_label)
				twin_sunflower_label.position = Vector2(50, 360) 
			#endregion
			#region Plasma Wood Error
			elif Global.plasma_wood_selected == true and Global.torchwood_selected == false:
				get_parent().add_child(plasma_wood_label)
				plasma_wood_label.position = Vector2(50, 360)
			#endregion
			#region Frost Pea Error
			elif Global.frost_pea_selected == true and Global.snow_pea_selected == false:
				get_parent().add_child(frost_pea_label)
				frost_pea_label.position = Vector2(50, 360)
			#endregion
			#region Gatling Pea Error
			elif Global.gatling_gun_selected == true and Global.repeater_selected == false:
				get_parent().add_child(gatling_pea_label)
				gatling_pea_label.position = Vector2(50, 360)
			#endregion
			#region Tall Nut Error
			elif Global.tall_nut_selected == true and Global.wallnut_selected == false:
				get_parent().add_child(tall_nut_label)
				tall_nut_label.position = Vector2(50, 360)
			#endregion
			else:
				if Global.endless_mode:
					get_tree().change_scene_to_file("res://scenes/levels/endless_level.tscn")
				elif not Global.endless_mode:
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
		if Input.is_action_just_pressed("esc"):
			Global.endless_mode = false
			get_tree().change_scene_to_file("res://scenes/ui/start_menu.tscn")
#endregion

func _process(_delta: float) -> void:
	if Global.new_open_slot or Global.new_open_slot_2 or Global.new_open_slot_3 or Global.new_open_slot_4 or Global.new_open_slot_5:
		Global.is_new_open_slot = true
	else:
		Global.is_new_open_slot = false
	if Global.upgrade_new_open_slot or Global.upgrade_new_open_slot_2 or Global.upgrade_new_open_slot_3:
		Global.is_new_upgrade_open_slot = true
	else:
		Global.is_new_upgrade_open_slot = false
