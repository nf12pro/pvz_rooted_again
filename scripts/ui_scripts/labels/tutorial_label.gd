extends Label

func _process(_delta: float) -> void:
	if Global.tutorial_peashooter_pressed:
		text = "Click on the grass to place your seed!"
	elif not Global.tutorial_peashooter_planter_tracker:
		get_tree().paused = false
		text = "Nicely done!"
	elif Global.tutorial_sunflower_pause:
		text = "Sunflowers generate sun for you needed to grow plants, they are EXTREMELY IMPORTANT! Try placing a few"
		Global.tutorial_peashooter_planter_tracker = true
	elif not Global.tutorial_sunflower_planted:
		text = "Try to plant as many as you can!"
