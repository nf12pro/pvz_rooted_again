extends Area2D

var plant_hp = 200 

func layer_setting():
	collision_layer = 1
	collision_mask = 3

func _ready():
	print("Test")


func _on_body_entered(body: Node) -> void:
	print("Test1")
	if body.is_in_group("Pea_Projectile"):
		print("Pea Projectile")
		if body.has_method("take_damage"):
			queue_free() 
