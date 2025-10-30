extends Button

@export var seed_name: String = "Peashooter"
@export var seed_scene: PackedScene = preload("res://scenes/plants/world_1_basic/plant_seeds/peashooter_seed.tscn")

func _ready():
	connect("pressed", Callable(self, "_on_seed_clicked"))

func _on_seed_clicked():
	# Add this seed to the selected HBox
	if Global.seed_picker:
		Global.seed_picker.add_seed(seed_name, seed_scene)
