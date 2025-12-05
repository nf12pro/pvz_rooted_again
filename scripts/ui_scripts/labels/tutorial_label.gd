extends Label

func _process(_delta: float) -> void:
	if Global.tutorial_peashooter_pressed:
		text = "Click on the grass to place your seed!"
	elif not Global.tutorial_peashooter_planted:
		text = "Nicely done!"
