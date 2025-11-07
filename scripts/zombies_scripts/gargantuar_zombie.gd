extends CharacterBody2D

#region Variables
@export var speed: float = 25.0
@export var original_speed: float = 25.0
@export var hp: int = 3000
@export var damage_per_second: float = 999999.0
var current_slow: float = 0.0

var attacking_plant = null
var damage_timer: float = 0.0
var print_timer: float = 0.0

var is_winding_up: bool = false
@export var windup_time: float = 1.0
#endregion

#region Layers/Masks
func layer_setting():
	collision_layer = 1
	collision_mask = 2
#endregion

func _ready() -> void:
	if Global.easy_mode == true:
		hp = 1520

#region Zombie Movement
func _physics_process(delta: float):
	if attacking_plant == null:
		is_winding_up = false
		velocity.x = -speed
	else:
		if is_winding_up:
			velocity.x = 0
			return

		velocity.x = 0
		if attacking_plant != null and attacking_plant.is_inside_tree():
			if attacking_plant.has_method("take_damage"):
				speed = 0
				attacking_plant.take_damage(damage_per_second * delta)
				
				damage_timer += delta
				if damage_timer >= 0.5:
					damage_timer = 0.0

			if attacking_plant.plant_hp <= 0:
				attacking_plant = null
				speed = original_speed
		else:
			attacking_plant = null
			speed = original_speed

	velocity.y = 0
	move_and_slide()
#endregion

#region Zombie Dies
func take_damage(amount: int) -> void:
	hp -= amount
	if hp <= 0:
		Global.score += 10
		Global.spawn_score += 10
		queue_free()
#endregion

#region Zombie touches Plant
func _on_body_entered(body: Node2D):
	if body.is_in_group("Plant"):
		attacking_plant = body
		is_winding_up = true
		speed = 0
		start_windup()
#endregion

func start_windup() -> void:
	await get_tree().create_timer(windup_time).timeout
	is_winding_up = false
#endregion

#region Slow and Freze
func take_freeze(ice_time: float):
	speed = 0
	await get_tree().create_timer(ice_time).timeout
	speed = original_speed

func slow_down(slow_time: float, slow_amount: float):
	if speed == original_speed:
		speed -= slow_amount
		current_slow = slow_amount
		await get_tree().create_timer(slow_time).timeout
		speed = original_speed
		current_slow = 0
	elif speed != original_speed:
		if slow_amount > current_slow:
			speed = original_speed
			speed -= slow_amount
			await get_tree().create_timer(slow_time).timeout
			speed = original_speed
#endregion
