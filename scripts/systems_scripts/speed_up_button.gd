extends Button

var is_fast = false

func _on_speed_2x_pressed():
	speed_up()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Space") or Input.is_action_just_pressed("A"):
		speed_up()

func speed_up():
	is_fast = !is_fast
	if is_fast:
		Engine.time_scale = 2.0   # Doubles game speed
		text = "Speed: 2x"
	else:
		Engine.time_scale = 1.0   # Normal speed
		text = "Speed: 1x"
