extends Control

func _ready() -> void:
	if Global.mower_not_used_achievement == true:
		$".".show()
	elif Global.mower_not_used_achievement == false:
		$".".hide()
