extends CharacterBody2D

#region Variables
var speed: float = 600.0
var damage: int = 9999999999
var active: bool = false
#endregion


#region Layer Settings
func layer_setting():
	collision_layer = 3 
	collision_mask = 1
#endregion

#region Bullet Speed/Movement
func _physics_process(delta):
	if active == true:
		position.x += speed * delta
		delete_mower()
#endregion

#region Mower System
func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Zombie"):
		if active == false:
			if body.has_method("take_damage"):
				body.take_damage(damage)
			active = true
			Global.mower_used = true
			print(Global.mower_used)
		elif active == true:
			if body.has_method("take_damage"):
				body.take_damage(damage)
				
#endregion

#region Delete Mower
func delete_mower():
	if position.x >= 1500:
		print("Deleted Mower")
		queue_free()
#endregion
