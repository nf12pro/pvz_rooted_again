extends StaticBody2D

#region Variables
var plant_hp = 4000
var square: Node = null

var is_wallnut = true
#endregion


func set_square(square_node):
	square = square_node

#region Layer Settings
func layer_setting():
	collision_layer = 2
	collision_mask = 1
#endregion

#region Take Damage
func take_damage(amount: float) -> void:
	plant_hp -= amount
	if plant_hp <= 0:
		if square != null and square.has_method("free_square"):
			square.free_square()
		queue_free()
#endregion
