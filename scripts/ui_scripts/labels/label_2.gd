extends Label

func _process(_delta: float) -> void:
	if Global.amount_of_upgrade_seeds == 1:
		text = "Remaining Upgrade Seeds: 2"
	elif Global.amount_of_upgrade_seeds == 2:
		text = "Remaining Upgrade Seeds: 1"
	elif Global.amount_of_upgrade_seeds == 3:
		text = "No Remaining Upgrade Seeds"
