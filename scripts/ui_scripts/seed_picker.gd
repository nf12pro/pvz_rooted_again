extends Control

var life_time = 3.0
var plasma_pea_error = preload("res://scenes/ui/labels/plasma_pea_upgrade_error.tscn")


func _unhandled_key_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("Space"):
		var plasma_pea_label = plasma_pea_error.instantiate()
		if Global.plasma_pea_selected == true and Global.peashooter_selected == false:
			get_parent().add_child(plasma_pea_label)
			plasma_pea_label.position = Vector2(50, 360) 
# Create a Tween for fading out
			var tween = create_tween()
			tween.tween_property(plasma_pea_label, "modulate:a", 0.0, life_time) # fade to 0 alpha over 0.5s
			tween.set_trans(Tween.TRANS_SINE)
			tween.set_ease(Tween.EASE_IN_OUT)

			# Wait for label to live before fading
			await get_tree().create_timer(life_time).timeout

			# Start fading
			await tween.finished

			# Remove label after fade
			plasma_pea_label.queue_free()
		elif Global.current_level == 1:
			get_tree().change_scene_to_file("res://scenes/systems/power_systems/powers_picker.tscn")
		elif Global.current_level == 2:
			get_tree().change_scene_to_file("res://scenes/levels/level_2.tscn")
		elif Global.current_level == 3:
			get_tree().change_scene_to_file("res://scenes/levels/level_3.tscn")
		elif Global.current_level == 4:
			get_tree().change_scene_to_file("res://scenes/levels/level_4.tscn")
		elif Global.current_level == 5:
			get_tree().change_scene_to_file("res://scenes/levels/level_5.tscn")
