extends Area2D

#region Variables
var plant_scene: PackedScene = preload("res://scenes/plants/world_1_basic/sunflower.tscn")
var overlay_scene: PackedScene = preload("res://scenes/plants/world_1_basic/plant_seeds/overlays/sun_overlay.tscn")
var overlay_instance: Node2D = null
@export var cost: int = 50
var is_selected: bool = false

@export var cooldown_time: float = 5.0
var cooldown_timer: float = 0.0

var draw_progress: float = 0.0  
#endregion

#region Setup
func _ready():
	connect("input_event", Callable(self, "_on_input_event"))
	z_index = 100
	if Global.cooldown_boost == true:
		cooldown_time = cooldown_time / 2
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
		else:
			print("Not enough sun!")
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
				if clicked_node.has_plant:
					is_selected = false
					overlay_instance.queue_free()
					overlay_instance = null
					return

				var plant = plant_scene.instantiate()
				get_tree().current_scene.add_child(plant)
				clicked_node.snap_plant(plant)

				Global.sun_value -= cost
				is_selected = false
				cooldown_timer = cooldown_time

				if overlay_instance:
					overlay_instance.queue_free()
					overlay_instance = null
				return

		is_selected = false
		if overlay_instance:
			overlay_instance.queue_free()
		print("You must plant on a grid square!")
#endregion

#region Overlay Follow
func _process(delta):
	if overlay_instance and is_selected:
		overlay_instance.global_position = get_global_mouse_position()
		$".".modulate.a = 0.5
	elif not overlay_instance and not is_selected:
		$".".modulate.a = 1
	elif not overlay_instance:
		$".".modulate.a = 1
		is_selected = false
	if cooldown_timer > 0.0:
		cooldown_timer -= delta
		if cooldown_timer < 0.0:
			cooldown_timer = 0.0
		draw_progress = cooldown_timer / cooldown_time
		queue_redraw()
	else:
		draw_progress = 0.0
#endregion

func start_cooldown():
	queue_redraw()  

func _draw():
	if draw_progress > 0.0:
		var rect_size = Vector2(114, 110 * draw_progress)
		
		var offset = Vector2(-rect_size.x + 57.5, -rect_size.y + 50) 
		var rect = Rect2(offset, rect_size)
		
		draw_rect(rect, Color(0, 0, 0, 0.5))
