extends CharacterBody2D

#region Variables
var speed: float = 15.0
var original_speed: float = 15
var first_hit_speed: float = 50.0        # Speed before first attack
var hp: int = 190
var armour_hp: int = 1500
var damage_per_second: float = 50.0       # Damage to plants per second
var first_hit_bonus: int = 1000            # Extra damage on first attack

var attacking_plant = null                # Reference to the plant currently being attacked
var damage_timer: float = 0.0             # Timer to control damage frequency
var first_hit_done: bool = false          # Track if first hit has been applied
#endregion

#region Layers/Masks
func layer_setting():
	collision_layer = 1
	collision_mask = 2
#endregion

#region Zombie Movement
func _physics_process(delta: float):
	# Determine current speed
	var current_speed = speed
	if not first_hit_done:
		current_speed = first_hit_speed

	if attacking_plant == null:
		velocity.x = -current_speed
	else:
		velocity.x = 0
		# Deal damage over time
		if attacking_plant != null and attacking_plant.is_inside_tree():
			if attacking_plant.has_method("take_damage"):
				# First hit bonus (only once)
				if not first_hit_done:
					attacking_plant.take_damage(first_hit_bonus)
					first_hit_done = true
					print(hp)

				# Normal damage over time
				attacking_plant.take_damage(damage_per_second * delta)
				damage_timer += delta
				if damage_timer >= 0.5:
					damage_timer = 0.0

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
func _on_body_entered(body: Node2D):
	if body.is_in_group("Plant"):
		attacking_plant = body
#endregion
