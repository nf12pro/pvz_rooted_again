extends CharacterBody2D

var speed: float = 100
var damage: int = 40
var lifetime: float = 0.3  # how long the laser stays on screen

func _ready():
	_free_after_delay()  # Start a timer to free the laser after `lifetime` seconds

func _process(delta):
	position += Vector2(speed * delta, 0)  # Move right
	if position.x > 2000:
		queue_free()

func _free_after_delay() -> void:
	await get_tree().create_timer(lifetime).timeout
	queue_free()

func _on_area_entered(area):
	if area.is_in_group("Zombie"):
		if area.has_method("take_damage"):
			area.take_damage(damage)
		# Laser now stays briefly before disappearing
