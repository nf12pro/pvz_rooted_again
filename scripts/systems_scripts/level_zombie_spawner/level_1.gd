extends Node2D

var first_check: bool = false
func _process(_delta: float) -> void:
	if Global.tutorial_completed:
		await get_tree().create_timer(0.9).timeout
		Global.first_time_play = false
		get_tree().change_scene_to_file("res://scenes/ui/start_menu.tscn")
	elif Global.tutorial_zombie_count == 1:
		if not first_check:
			first_check = true
			Global.tutorial_peashooter_planter_tracker = true
			Global.tutorial_sunflower_pause = true
	elif Global.tutorial_zombie_count == 3:
		Global.tutorial_completed = true
