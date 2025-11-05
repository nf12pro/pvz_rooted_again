extends StaticBody2D

var plant_hp = 200 
var bullet = preload("res://scenes/plants/projectiles/fire_pea_projectile.tscn")
var bullet1 = preload("res://scenes/plants/projectiles/pea_projectile.tscn")
var square: Node = null
var is_torchwood = true

@onready var my_sprite = $AnimatedSprite2D 



func set_square(square_node):
	square = square_node

func _ready():
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Pea_Projectile"):
		if "recent" in body and body.recent == false:
			body.call_deferred("queue_free")
			call_deferred("_spawn_bullet", bullet)
	elif body.is_in_group("Ice_Pea_Projectile"):
		body.call_deferred("queue_free")
		call_deferred("_spawn_bullet", bullet1)

func _spawn_bullet(bullet_scene: PackedScene) -> void:
	var pea = bullet_scene.instantiate()
	pea.position = global_position
	get_parent().add_child(pea)

func take_damage(amount: float) -> void:
	plant_hp -= amount
	if plant_hp <= 0:
		if square != null and square.has_method("free_square"):
			square.free_square()
		queue_free()

#region Contrast
func _physics_process(_delta: float) -> void:
	if Global.plasma_wood_is_selected == true:
		my_sprite.modulate = Color(1.825, 1.825, 1.825)
	else:
		my_sprite.modulate = Color(1, 1, 1)
#endregion
