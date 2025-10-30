extends CharacterBody2D

#region Variables
var speed: float = 600.0
var damage: int = 20
#endregion


#region Layer Settings
func layer_setting():
	collision_layer = 3  # Layer 1 and Layer 5
	collision_mask = 1
#endregion

#region Bullet Speed/Movement
func _physics_process(delta):
	position.x += speed * delta
	delete_pea()
#endregion

#region Do Damage
func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Zombie"):
		if body.has_method("take_damage"):
			body.take_damage(damage)
			queue_free() 
#endregion

#region Delete Pea
func delete_pea():
	if position.x >= 1500:
		queue_free()
#endregion
