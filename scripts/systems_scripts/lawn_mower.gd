extends CharacterBody2D

#region Variables
@export var speed: float = 300.0
var damage: int = 9999999999
var active: bool = false

var count_tracker = 0
#endregion

func _ready() -> void:
	if Global.mowers_nerf == true:
		queue_free()

#region Layer Settings
func layer_setting():
	collision_layer = 3 
	collision_mask = 1
#endregion

#region Bullet Speed/Movement
func _physics_process(delta):
	if active:
		$AnimatedSprite2D.play("default")
		position.x += speed * delta
		delete_mower()
#endregion

#region Mower System
func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Zombie"):
		if body.has_method("take_damage"):
			body.take_damage(damage)
		if not active:
			active = true
			Global.mower_used = true
			print("Mower activated by collision!")
#endregion

#region Delete Mower
func delete_mower():
	if position.x >= 1500:
		print("Deleted Mower")
		queue_free()
#endregion

#region Click-and-Hold Activation 

#func _on_input_event(_viewport, event, _shape_idx):
	#if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		#print("INPUT RECEIVED")
		#if count_tracker >= 5:
		#	active = true
		#	print("INPUT")
		#else:
		#	count_tracker += 1

func _on_button_pressed() -> void:
	if count_tracker >= 5:
		active = true
	else:
		count_tracker += 1
