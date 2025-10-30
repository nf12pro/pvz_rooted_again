extends CharacterBody2D

#region Variables
var speed: float = 600.0
var damage: int = 40
#endregion


#region Layer Settings
func layer_setting():
	collision_layer = 3
	collision_mask = 1
#endregion

#region Bullet Speed/Movement
func _physics_process(delta):
	position.x += speed * delta
#endregion

#region Do Damage

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Zombie"):
		if body.has_method("take_damage"):
			body.take_damage(damage)

		queue_free()  # destroy projectile after hitting
#endregion

#region Delete Pea
func delete_pea():
	if position.x >= 1500:
		print("Deleted Pea")
		queue_free()
#endregion
