extends Sprite2D

#region Follow Mouse
func _process(_delta):
	position = get_global_mouse_position()
#endregion
