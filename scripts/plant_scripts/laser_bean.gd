extends StaticBody2D

var bullet_scene = preload("res://scenes/plants/projectiles/laser_projectile.tscn")
var plant_hp = 300
var shoot_cooldown = 2.7
var shoot_timer = 0.0
var targets = []
var square: Node = null

func set_square(square_node):
	square = square_node

func _process(delta):
	if targets.size() == 0:
		return

	shoot_timer -= delta
	if shoot_timer <= 0:
		shoot_at_first_target()
		shoot_timer = shoot_cooldown

func shoot_at_first_target():
	if targets.size() == 0:
		return

	var target = targets[0]
	if is_instance_valid(target):
		var laser = bullet_scene.instantiate()
		laser.position = global_position
		laser.look_at(target.global_position)
		get_parent().add_child(laser)
	else:
		targets.remove(0)

func take_damage(amount: float) -> void:
	plant_hp -= amount
	if plant_hp <= 0:
		if square != null and square.has_method("free_square"):
			square.free_square()
		queue_free()

func _on_tower_body_entered(body: Node2D) -> void:
	if body.is_in_group("Zombie") and not targets.has(body):
		targets.append(body)

func _on_tower_body_exited(body: Node2D) -> void:
	if targets.has(body):
		targets.erase(body)
