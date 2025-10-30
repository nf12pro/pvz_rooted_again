extends StaticBody2D

#region Variables
var plant_hp = 200 
var bullet = preload("res://scenes/plants/projectiles/fire_pea_projectile.tscn")
var square: Node = null
var is_torchwood = true
#endregion

func set_square(square_node):
	square = square_node

func _ready():
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Pea_Projectile"):
		body.queue_free()
		var pea = bullet.instantiate()
		pea.position = global_position
		get_parent().add_child(pea)

#region Take Damage
func take_damage(amount: float) -> void:
	plant_hp -= amount
	if plant_hp <= 0:
		if square != null and square.has_method("free_square"):
			square.free_square()
		queue_free()
#endregion
