extends CharacterBody2D

#region Variables
@export var speed: float = 600.0
@export var damage: int = 40
@export var freeze_duration: float = 1.5
#endregion

func _ready() -> void:
	if Global.pea_boost == 1:
		damage = 60
	elif Global.pea_boost == 2:
		damage = 80
	elif Global.pea_boost == 3:
		damage = 120
#region Layer Settings
func layer_setting():
	collision_layer = 3  # Layer 1 and Layer 5
	collision_mask = 1
#endregion

#region Bullet Speed/Movement
func _physics_process(delta):
	position.x += speed * delta
	delete_pea()
#endregion

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Zombie"):
		if body.has_method("take_freeze"):
			body.take_freeze(freeze_duration)
			body.take_damage(damage)
			queue_free()

#region Delete Pea
func delete_pea():
	if position.x >= 1500:
		queue_free()
#endregion
