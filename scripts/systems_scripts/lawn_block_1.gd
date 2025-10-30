extends Area2D

#region Variables
var has_plant: bool = false
var current_plant: Node = null
#endregion


#region Snap Plant
func snap_plant(plant: Node) -> void:
	current_plant = plant
	has_plant = true
	plant.global_position = global_position

	if plant.has_method("set_square"):
		plant.set_square(self)
#endregion


#region Free Square
func free_square() -> void:
	has_plant = false
	current_plant = null
#endregion
