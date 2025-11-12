extends StaticBody2D

#region Variables
var bullet = preload("res://scenes/plants/projectiles/acid_level1_projectile.tscn")
var bullet2 = preload("res://scenes/plants/projectiles/acid_level2_projectile.tscn")
var bullet3 = preload("res://scenes/plants/projectiles/acid_level3_projectile.tscn")

@export var plant_hp = 300
var is_peashooter = true
# Shooting logic
var targets = []               # List of zombies currently in range
var range_fix = 0
var range_priority = false
@export var shoot_cooldown = 2.5       # Seconds between shots

var charge_counting = 0.0
@export var cooldown_1_acid = 1.0
@export var cooldown_2_acid = 5.0
@export var cooldown_3_acid = 10.0

var shoot_timer = 0.0
var square: Node = null

@onready var my_sprite = $AnimatedSprite2D 
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
	charge_counting += delta
	if targets.size() == 0: #if no zombie it does nothing
		return  
	shoot_timer -= delta
	if shoot_timer <= 0:
		if charge_counting < cooldown_2_acid:
			shoot_at_first_target_weak()
		elif charge_counting < cooldown_3_acid and charge_counting >= cooldown_2_acid:
			shoot_at_first_target_medium()
		elif charge_counting >= cooldown_3_acid:
			shoot_at_first_target_strong()
		$AnimatedSprite2D.play("attack_animation")
		range_priority = false
		shoot_timer = shoot_cooldown  # Reset timer
#endregion

#region Bullet System
func shoot_at_first_target_weak():
	var target = targets[0]
	if is_instance_valid(target):
		var pea1 = bullet.instantiate()
		if range_fix == 1:
			pea1.position = global_position + Vector2(100, 0)
		elif range_fix == 2:
			pea1.position = global_position + Vector2(200, 0)
		get_parent().add_child(pea1)
		print("Weak Charge")
		charge_counting = 0
	else:
		targets.remove(0)  # Remove dead or invalid target
		
func shoot_at_first_target_medium():
	var target = targets[0]
	if is_instance_valid(target):
		var pea2 = bullet2.instantiate()
		if range_fix == 1:
			pea2.position = global_position + Vector2(100, 0)
		elif range_fix == 2:
			pea2.position = global_position + Vector2(200, 0)
		get_parent().add_child(pea2)
		print("Medium Charge")
		charge_counting = 0
	else:
		targets.remove(0)

func shoot_at_first_target_strong():
	var target = targets[0]
	if is_instance_valid(target):
		var pea3 = bullet3.instantiate()
		if range_fix == 1:
			pea3.position = global_position + Vector2(100, 0)
		elif range_fix == 2:
			pea3.position = global_position + Vector2(200, 0)
		get_parent().add_child(pea3)
		print("Strong Charge")
		charge_counting = 0
	else:
		targets.remove(0)
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
		range_priority = true
		range_fix = 1

func _on_tower_body_entered_medium(body: Node2D) -> void:
	if body.is_in_group("Zombie") and not targets.has(body):
		targets.append(body)
		if not range_priority:
			range_fix = 2

func _on_tower_body_exited(body: Node2D) -> void:
	if targets.has(body):
		targets.erase(body)
		range_fix = 0
#endregion

#region Picking Range
func _on_check_range_1(body: Node2D) -> void:
	if body.is_in_group("Zombie"):
		range_priority = true
		range_fix = 1

func _on_check_range_2(body: Node2D) -> void:
	if body.is_in_group("Zombie") and not range_priority:
		range_fix = 2

#region Contrast
#func _physics_process(_delta: float) -> void:
	#if Global.plasma_pea_is_selected == true:
		#my_sprite.modulate = Color(1.825, 1.825, 1.825)
	#else:
		#my_sprit`e.modulate = Color(1, 1, 1)
#endregion
