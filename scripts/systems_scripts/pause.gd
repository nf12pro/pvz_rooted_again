extends Control

func _ready() -> void:
	$".".hide() 
	

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		pause_or_unpause()
		

func pause_or_unpause():
	if get_tree().paused == true:
		$".".hide() 
		get_tree().paused = false
	elif get_tree().paused == false:
		$".".show() 
		get_tree().paused = true


func _on_return_to_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/start_menu.tscn")
