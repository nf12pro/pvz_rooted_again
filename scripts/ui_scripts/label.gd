extends Label

func _process(_delta: float) -> void:
	if Global.amount_of_seeds == 0:
		text = "Remaining Seeds: 5"
	elif Global.amount_of_seeds == 1:
		text = "Remaining Seeds: 4"
	elif Global.amount_of_seeds == 2:
		text = "Remaining Seeds: 3"
	elif Global.amount_of_seeds == 3:
		text = "Remaining Seeds: 2"
	elif Global.amount_of_seeds == 4:
		text = "Remaining Seeds: 1"
	elif Global.amount_of_seeds == 5:
		text = "No Remaining Seeds, Press Space to Start"
