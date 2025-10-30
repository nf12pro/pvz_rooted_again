extends Area2D

var damage: int = 1800
var blast_size: Vector2 = Vector2(500, 500)
var explosion_delay: float = 1.5

var square: Node = null

func _ready() -> void:
	explode_after_delay()

#region Square
func set_square(square_node):
	square = square_node
#endregion


func _draw() -> void:
	var top_left = -blast_size / 2
	draw_rect(Rect2(top_left, blast_size), Color(1, 0, 0, 0.3), true)

func explode_after_delay() -> void:
	await get_tree().create_timer(explosion_delay).timeout
	_explode()

func _explode() -> void:
	var rect = RectangleShape2D.new()
	rect.extents = blast_size / 2

	var params = PhysicsShapeQueryParameters2D.new()
	params.shape = rect
	params.transform = Transform2D(0, global_position)
	params.collide_with_bodies = true
	params.collide_with_areas = false

	var space_state = get_world_2d().direct_space_state
	var results = space_state.intersect_shape(params, 64)

	for item in results:
		if typeof(item) == TYPE_DICTIONARY and item.has("collider"):
			var collider = item["collider"]
			if collider.is_in_group("Zombie"):
				if collider and collider.has_method("take_damage"):
					collider.take_damage(damage)
			
	if square != null and square.has_method("free_square"):
		$".".hide()
		await get_tree().create_timer(40.0).timeout
		square.free_square()
		queue_free()
