extends Control

func _ready() -> void:
	if Global.sun_collector_achievement == true:
		$".".show()
	elif Global.sun_collector_achievement == false:
		$".".hide()
