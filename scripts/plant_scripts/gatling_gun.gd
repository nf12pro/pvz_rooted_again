extends StaticBody2D

#region Variables
var bullet = preload("res://scenes/plants/projectiles/pea_projectile.tscn")
var plant_hp = 300

# Shooting logic
var targets = []               # List of zombies currently in range
var shoot_cooldown = 1.35     # Seconds between shots (longer than Peashooter)
var shoot_timer = 0.0
var repeater_shot_delay = 0.05  # Delay between the two shots
var shot_count = 0              # Counter for number of shots in this firing sequence
#endregion

#region Layer Settings
func layer_setting():
	collision_layer = 2
	collision_mask = 1
#endregion

#region Check Zombies/Attack
func _process(delta):
	if targets.size() == 0: # If no zombie, do nothing
		return  

	shoot_timer -= delta
	if shoot_timer <= 0:
		shot_count = 0
		shoot_two_shots()
		shoot_timer = shoot_cooldown  # Reset timer
#endregion

#region Bullet System
func shoot_two_shots():
	# Fire first shot immediately
	fire_pea()
	shot_count += 1
	
	# Schedule second shot after a short delay
	if shot_count == 1:
		await get_tree().create_timer(repeater_shot_delay).timeout
		fire_pea()
		shot_count += 1
	if shot_count == 2:
		await get_tree().create_timer(repeater_shot_delay).timeout
		fire_pea()
		shot_count += 1
	if shot_count == 3:
		await get_tree().create_timer(repeater_shot_delay).timeout
		fire_pea()
		shot_count += 1

func fire_pea():
	if targets.size() == 0:
		return
	var target = targets[0]
	if is_instance_valid(target):
		var pea = bullet.instantiate()
		pea.position = global_position
		get_parent().add_child(pea)
	else:
		targets.remove(0)  # Remove dead or invalid target
#endregion

#region Take Damage
var square: Node = null
func set_square(square_node):
	square = square_node

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
