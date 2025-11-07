extends StaticBody2D

#region Variables
@export var plant_hp = 8000
var square: Node = null
#endregion

func _ready() -> void:
	if Global.defense_boost == 1:
		plant_hp = 12000
	elif Global.defense_boost == 2:
		plant_hp = 16000
	elif Global.defense_boost == 3:
		plant_hp = 24000

func set_square(square_node):
	square = square_node

#region Layer Settings
func layer_setting():
	collision_layer = 2
	collision_mask = 1
#endregion

#region Take Damage
func take_damage(amount: float) -> void:
	plant_hp -= amount
	if plant_hp <= 0:
		if square != null and square.has_method("free_square"):
			square.free_square()
		queue_free()
#endregion
