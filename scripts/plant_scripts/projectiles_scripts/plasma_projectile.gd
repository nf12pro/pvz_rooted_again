extends CharacterBody2D

#region Variables
@export var speed: float = 600.0
@export var damage: int = 60
var recent: bool = true
#endregion

func _ready() -> void:
	if Global.pea_boost == 1:
		damage = 90
	elif Global.pea_boost == 2:
		damage = 120
	elif Global.pea_boost == 3:
		damage = 180
	await get_tree().create_timer(0.04).timeout
	recent = false

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
		queue_free()
#endregion
