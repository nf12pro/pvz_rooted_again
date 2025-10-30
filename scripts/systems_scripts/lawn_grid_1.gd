extends Node2D

#region Variables
const ROWS = 5
const COLUMNS = 9
const CELL_SIZE = Vector2(100, 100) # change depending on your lawn tile size

@onready var cell_scene = preload("res://scenes/systems/lawn_block_1.tscn")
#endregion

func _ready():
	for row in range(ROWS):
		for col in range(COLUMNS):
			var cell = cell_scene.instantiate()
			cell.position = Vector2(col * CELL_SIZE.x, row * CELL_SIZE.y)
			add_child(cell)
