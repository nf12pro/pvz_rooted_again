extends Area2D

#region Variables
var ice_duration = 3
var ice_timer = 0.0
var damage = 190

var plant_hp = 1500

var square: Node = null
#endregion

#region Square
func set_square(square_node):
	square = square_node
#endregion

#region Layer Settings
func layer_setting():
	collision_layer = 3  # Layer 1 and Layer 5
	collision_mask = 1
#endregion


#region Do Damage
func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Zombie"):
		if body.has_method("take_freeze"):
			body.take_freeze(ice_duration)
			body.take_damage(damage)
			if square != null and square.has_method("free_square"):
				square.free_square()
				queue_free()
#endregion

#region Take Damage
func take_damage(amount: float) -> void:
	plant_hp -= amount
	if plant_hp <= 0:
		if square != null and square.has_method("free_square"):
			square.free_square()
		queue_free()
#endregion
