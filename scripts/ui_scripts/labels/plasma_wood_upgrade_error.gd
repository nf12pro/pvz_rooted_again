extends Label

var life_time := 2.5

func _ready():
	# Start fading as soon as the label appears
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, life_time)
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_IN_OUT)
	await get_tree().create_timer(life_time).timeout
	queue_free()
