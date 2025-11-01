extends StaticBody2D

#region Variables
var bullet = preload("res://scenes/plants/projectiles/ice_pea_projectile.tscn")
var plant_hp = 300
# Shooting logic
var is_icepea = true

var targets = []               # List of zombies currently in range
var shoot_cooldown = 1.0       # Seconds between shots
var shoot_timer = 0.0
var square: Node = null
#endregion

func set_square(square_node):
	square = square_node

#region Layer Settings
func layer_setting():
	collision_layer = 2
	collision_mask = 1
#endregion

#region Check Zombies/Attack
func _process(delta):
	if targets.size() == 0: #if no zombie it does nothing
		return  

	shoot_timer -= delta
	if shoot_timer <= 0:
		shoot_at_first_target()
		shoot_timer = shoot_cooldown  # Reset timer
#endregion

#region Bullet System
func shoot_at_first_target():
	var target = targets[0]
	if is_instance_valid(target):
		var pea = bullet.instantiate()
		pea.position = global_position
		get_parent().add_child(pea)
	else:
		targets.remove(0)  # Remove dead or invalid target
#endregion

#region Take Damage
func take_damage(amount: float) -> void:
	plant_hp -= amount
	if plant_hp <= 0:
		if square != null and square.has_method("free_square"):
			square.free_square()
		queue_free()
#endregion

#region Detection Zombie
func _on_tower_body_entered(body: Node2D) -> void:
	if body.is_in_group("Zombie") and not targets.has(body):
		targets.append(body)

func _on_tower_body_exited(body: Node2D) -> void:
	if targets.has(body):
		targets.erase(body)
#endregion
