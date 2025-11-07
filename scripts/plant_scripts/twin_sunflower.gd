extends StaticBody2D

#region Variables
var sun_scene = preload("res://scenes/plants/projectiles/sun_projectile.tscn")
@export var plant_hp = 300
@export var produce_interval = 5.0 # seconds between suns
@export var second_sun_delay = 0.95
var produce_timer = 0.0
var square: Node = null
var sun_count: int = 2
#endregion


func set_square(square_node):
	square = square_node

#region Layer Settings
func layer_setting():
	collision_layer = 2
	collision_mask = 1
#endregion

#region Sun Production
func _process(delta):
	produce_timer += delta
	if produce_timer >= produce_interval:
		produce_sun()
		produce_timer = 0.0

func produce_sun():
	for i in range(sun_count):
		var sun = sun_scene.instantiate()
		sun.position = global_position + Vector2(0, -20) # slightly above the flower
		get_parent().add_child(sun)
	if Global.sun_boost == 0:
		Global.sun_value += 25
	elif Global.sun_boost == 1:
		Global.sun_value += 50
	elif Global.sun_boost == 2:
		Global.sun_value += 75
	elif Global.sun_boost == 3:
		Global.sun_value += 100
		await get_tree().create_timer(second_sun_delay).timeout
#endregion

#region Take Damage
func take_damage(amount: float) -> void:
	plant_hp -= amount
	if plant_hp <= 0:
		if square != null and square.has_method("free_square"):
			square.free_square()
		queue_free()
#endregion
