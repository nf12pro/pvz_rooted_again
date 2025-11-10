extends CharacterBody2D

#region Variables
@export var speed: float = 0.00000000000000000000000000000000000000000000000000000000000000000000000000000001
@export var damage: int = 999999
var recent: bool = true
@export var projectile_decay: float = 1.0
#endregion

func _ready() -> void:
	if Global.pea_boost == 1:
		damage = 30
	elif Global.pea_boost == 2:
		damage = 40
	elif Global.pea_boost == 3:
		damage = 60
	await get_tree().create_timer(0.02).timeout
	recent = false

#region Layer Settings
func layer_setting():
	collision_layer = 3  # Layer 1 and Layer 5
	collision_mask = 1
#endregion

#region Bullet Speed/Movement
func _physics_process(delta):
	position.x += speed * delta
	delete_pea()
	spike_delete()
#endregion

#region Do Damage
func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Zombie"):
		if body.has_method("take_damage"):
			body.take_damage(damage)
			print(damage)
#endregion

#region Delete Pea
func delete_pea():
	if position.x >= 1500:
		queue_free()
#endregion

func spike_delete():
	await get_tree().create_timer(projectile_decay).timeout
	queue_free()
