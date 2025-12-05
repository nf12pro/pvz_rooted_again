extends Label

var life_time: float = 3.0
var start_delay: float = 1.5

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
		await get_tree().create_timer(start_delay).timeout
		text = "Now try and beat this!"
		var tween = create_tween()
		tween.tween_property(self, "modulate:a", 0.0, life_time)
		tween.set_trans(Tween.TRANS_SINE)
		tween.set_ease(Tween.EASE_IN_OUT)
		await get_tree().create_timer(life_time).timeout
		queue_free()
