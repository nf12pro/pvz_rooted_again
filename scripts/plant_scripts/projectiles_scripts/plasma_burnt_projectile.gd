extends CharacterBody2D

#region Variables
var speed: float = 600.0
var damage: int = 160
var blast_size: Vector2 = Vector2(150, 150)
#endregion

func _ready() -> void:
	if Global.pea_boost == true:
		damage = damage * 2

#region Layer Settings
func layer_setting():
	collision_layer = 3
	collision_mask = 1
#endregion

func _draw() -> void:
	var top_left = -blast_size / 2
	draw_rect(Rect2(top_left, blast_size), Color(1, 0, 0, 0.3), true)

#region Bullet Speed/Movement
func _physics_process(delta):
	position.x += speed * delta
#endregion

#region Do Damage
func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Zombie"):
		if body.has_method("take_damage"):
			body.take_damage(damage)
		apply_aoe_damage()  # ← basic AOE added here
		queue_free()  # destroy projectile after hitting
#endregion

#region AOE Damage
func apply_aoe_damage():
	# Get all physics bodies in the scene
	for b in get_tree().get_nodes_in_group("Zombie"):
		if b.global_position.distance_to(global_position) <= blast_size.x / 2:
			if b.has_method("take_damage"):
				b.take_damage(damage)
#endregion

#region Delete Pea
func delete_pea():
	if position.x >= 1500:
		queue_free()
#endregion
