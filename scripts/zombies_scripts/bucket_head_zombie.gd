extends CharacterBody2D

#region Variables
var speed: float = 25.0
var original_speed: float = 25.0
var hp: int = 190
var armour_hp: int = 1100
var damage_per_second: float = 50.0   # Damage to plants per second

var attacking_plant = null  # Reference to the plant currently being attacked
var damage_timer: float = 0.0          # Timer to control damage message frequency
var print_timer: float = 0.0           # Timer to print plant HP every second
#endregion


#region Layers/Masks
func layer_setting():
	collision_layer = 1
	collision_mask = 2
#endregion

#region Zombie Movement
func _physics_process(delta: float):
	if attacking_plant == null:
		velocity.x = -speed
	else:
		velocity.x = 0
		# Deal damage over time
		if attacking_plant != null and attacking_plant.is_inside_tree():
			if attacking_plant.has_method("take_damage"):
				attacking_plant.take_damage(damage_per_second * delta)
				damage_timer += delta
				print_timer += delta
				if damage_timer >= 0.5:
					damage_timer = 0.0  # Reset timer

				# Print plant HP every second
				if print_timer >= 1.0:
					print_timer = 0.0
			# Check if plant died
			if attacking_plant.plant_hp <= 0:
				attacking_plant = null
		else:
			attacking_plant = null
	velocity.y = 0
	move_and_slide()
#endregion

#region Zombie Dies
func take_damage(amount: int) -> void:
	if armour_hp > 0:
		armour_hp -= amount
		if armour_hp < 0:
			# Carry over excess damage to HP
			hp += armour_hp  # since armour_hp is negative
			armour_hp = 0
	else:
		hp -= amount
	if hp <= 0:
		Global.score += 10
		queue_free()
#endregion

#region Zombie touches Plant
# Detect when zombie touches a plant
func _on_body_entered(body: Node2D):
	if body.is_in_group("Plant"):
		attacking_plant = body
#endregion

func take_freeze(ice_time: float):
	speed = 0
	await get_tree().create_timer(ice_time).timeout
	speed = original_speed

func slow_down(slow_time: float, slow_amount: float):
	speed =- slow_amount
	await get_tree().create_timer(slow_time).timeout
	speed = original_speed
