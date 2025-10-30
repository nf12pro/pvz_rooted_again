extends Area2D

#region Variables
var overlay_scene: PackedScene = preload("res://scenes/plants/world_1_basic/plant_seeds/overlays/peashooter_overlay.tscn")
var overlay_instance: Node2D = null
var is_selected: bool = false
#endregion

#region Setup
func _ready():
	connect("input_event", Callable(self, "_on_input_event"))
	set_process(true)
#endregion

#region Selection
func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# toggle shovel selection on click of the shovel UI node
		is_selected = not is_selected
		if is_selected:
			if overlay_instance == null:
				overlay_instance = overlay_scene.instantiate()
				get_tree().current_scene.add_child(overlay_instance)
		else:
			if overlay_instance:
				overlay_instance.queue_free()
				overlay_instance = null
#endregion

#region Deleting Plant
func _unhandled_input(event):
	if not is_selected:
		return

	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var click_pos = get_global_mouse_position()
		var space_state = get_world_2d().direct_space_state

		var params = PhysicsPointQueryParameters2D.new()
		params.position = click_pos
		params.collision_mask = 1 << 3   # match your lawn layer
		params.collide_with_areas = true
		params.collide_with_bodies = false

		var results = space_state.intersect_point(params, 32)

		for item in results:
			var clicked_node = item.get("collider")
			if clicked_node == null:
				continue

			# If we hit a lawn tile that has snap_plant, check its current_plant
			if clicked_node is Area2D and clicked_node.has_method("snap_plant"):
				var plant = null
				# rely on your lawn block storing current_plant
				if "current_plant" in clicked_node:
					plant = clicked_node.current_plant

				# if a plant exists, delete it and free the tile
				if plant != null:
					# optional: you can play a sound or effect here
					plant.queue_free()
					if clicked_node.has_method("free_square"):
						clicked_node.free_square()
					# stop after deleting one plant
					break

		# cleanup overlay and cancel selection
		if overlay_instance:
			overlay_instance.queue_free()
			overlay_instance = null
		is_selected = false
#endregion

#region Overlay Follow
func _process(_delta):
	if overlay_instance and is_selected:
		overlay_instance.global_position = get_global_mouse_position()
#endregion
