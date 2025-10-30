extends Control

func _ready() -> void:
	Global.sun_collector_achievement = true
	if Global.sun_collector_achievement == true:
		$".".show()
	elif Global.sun_collector_achievement == false:
		$".".hide()
