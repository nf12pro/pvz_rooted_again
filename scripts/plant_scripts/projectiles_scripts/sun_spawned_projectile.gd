extends Node2D

#region Variables
var speed: float = 200.0
var life_time: float = 5
#endregion


#region Sun Floating + Sun Fade
func _ready():

	# Create a gentle float + fade animation
	var tween = create_tween()
	
	# Float up a bit then back down smoothly
	var start_y = position.y
	tween.tween_property(self, "position:y", start_y - 20, 1.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "position:y", start_y, 1.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)

	# Fade away over lifetime
	tween.parallel().tween_property(self, "modulate:a", 0.0, life_time).set_trans(Tween.TRANS_LINEAR)

	# Delete after fading
	await get_tree().create_timer(life_time).timeout
	queue_free()
#endregion
