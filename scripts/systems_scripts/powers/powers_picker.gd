extends Control

#region Variables
var powers_randomized: int = 0
var powers_randomized_1: int = 0
var powers_randomized_2: int = 0
var max_powers: int = 3
var generated: bool = false

var sunboost_scene = preload("res://scenes/systems/power_systems/sun_boost_power.tscn")  
#endregion


func _process(_delta: float) -> void:
	if generated == false:
		powers_randomized = randi() % max_powers + 1 
		powers_randomized_1 = randi() % max_powers + 1
		powers_randomized_2 = randi() % max_powers + 1

		while powers_randomized == powers_randomized_1 or \
			  powers_randomized == powers_randomized_2 or \
			  powers_randomized_1 == powers_randomized_2:
			powers_randomized = randi() % max_powers + 1 
			powers_randomized_1 = randi() % max_powers + 1
			powers_randomized_2 = randi() % max_powers + 1

		print(powers_randomized)
		print(powers_randomized_1)
		print(powers_randomized_2)
		
		var sun_boost_power = sunboost_scene.instantiate()
		#region Sun_Boost
		if powers_randomized == 1:
			sun_boost_power.position = Vector2(60, 100)
			get_tree().current_scene.call_deferred("add_child", sun_boost_power)
		if powers_randomized_1 == 1:
			sun_boost_power.position = Vector2(450, 100)
			get_tree().current_scene.call_deferred("add_child", sun_boost_power)
		if powers_randomized_2 == 1:
			sun_boost_power.position = Vector2(840, 100)
			get_tree().current_scene.call_deferred("add_child", sun_boost_power)
		#endregion

		generated = true
