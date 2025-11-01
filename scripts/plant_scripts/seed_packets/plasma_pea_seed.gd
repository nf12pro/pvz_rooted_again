extends Area2D

#region Variables
var plant_scene: PackedScene = preload("res://scenes/plants/world_1_basic/plasma_peashooter.tscn")
var overlay_scene: PackedScene = preload("res://scenes/plants/world_1_basic/plant_seeds/overlays/plasma_pea_overlay.tscn")
var overlay_instance: Node2D = null
var cost: int = 75
var is_selected: bool = false

var cooldown_time: float = 25.0
var cooldown_timer: float = 0.0
#endregion


#region Setup
func _ready():
	connect("input_event", Callable(self, "_on_input_event"))
#endregion


#region Selection
func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if cooldown_timer > 0.0:
			print("Seed packet recharging!")
			return
		if Global.sun_value >= cost:
			is_selected = true

			if overlay_instance == null:
				overlay_instance = overlay_scene.instantiate()
				get_tree().current_scene.add_child(overlay_instance)
#endregion


#region Planting
func _unhandled_input(event):
	if is_selected and event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var click_pos = get_global_mouse_position()
		var space_state = get_world_2d().direct_space_state

		var params = PhysicsPointQueryParameters2D.new()
		params.position = click_pos
		params.collision_mask = 1 << 3
		params.collide_with_areas = true
		params.collide_with_bodies = false

		var results = space_state.intersect_point(params, 32)

		for item in results:
			var clicked_node = item.get("collider")
			if clicked_node == null:
				continue
			if clicked_node is Area2D and clicked_node.has_method("snap_plant"):
				# --- if the tile already has a plant ---
				if clicked_node.has_plant:
					var existing_plant = clicked_node.current_plant
					if existing_plant and "is_peashooter" in existing_plant:
						print("Upgrading to Plasma Pea")

						var pos = existing_plant.global_position
						existing_plant.queue_free()

						var new_plant = plant_scene.instantiate()
						get_tree().current_scene.add_child(new_plant)
						new_plant.global_position = pos

						clicked_node.current_plant = new_plant
						clicked_node.has_plant = true

						Global.sun_value -= cost
						is_selected = false
						cooldown_timer = cooldown_time

						if overlay_instance:
							overlay_instance.queue_free()
							overlay_instance = null
						return
					else:
						print("This square is already occupied!")
						return


		overlay_instance.queue_free()
		overlay_instance = null
		is_selected = false

#endregion


#region Overlay Follow
func _process(delta):
	if overlay_instance and is_selected:
		overlay_instance.global_position = get_global_mouse_position()

	if cooldown_timer > 0.0:
		cooldown_timer -= delta
		if cooldown_timer < 0.0:
			cooldown_timer = 0.0
#endregion
