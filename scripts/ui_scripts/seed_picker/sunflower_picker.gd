extends Button

var is_pressed: bool = false
var slot_of_sunflower: int = 0

func _on_pressed() -> void:
	if Global.amount_of_seeds < 6:
		if is_pressed == false:
			$".".modulate.a = 0.5
			Global.sunflower_selected = true
			Global.amount_of_seeds += 1
			if Global.amount_of_seeds == 1:
				Global.seed_1 = "Sunflower"
			elif Global.amount_of_seeds == 2:
				Global.seed_2 = "Sunflower"
			elif Global.amount_of_seeds == 3:
				Global.seed_3 = "Sunflower"
			elif Global.amount_of_seeds == 4:
				Global.seed_4 = "Sunflower"
			elif Global.amount_of_seeds == 5:
				Global.seed_5 = "Sunflower"
			elif Global.amount_of_seeds == 6:
				Global.seed_6 = "Sunflower"
			else:
				pass
			
			print(Global.seed_1)
			print("Sunflower Button")
			is_pressed = true
		
		elif is_pressed == true:
			$".".modulate.a = 1
			Global.sunflower_selected = false
			Global.amount_of_seeds -= 1
			print("test")
			if Global.amount_of_seeds == 1:
				Global.seed_1 = ""
			elif Global.amount_of_seeds == 2:
				Global.seed_2 = ""
			elif Global.amount_of_seeds == 3:
				Global.seed_3 = ""
			elif Global.amount_of_seeds == 4:
				Global.seed_4 = ""
			elif Global.amount_of_seeds == 5:
				Global.seed_5 = ""
			elif Global.amount_of_seeds == 6:
				Global.seed_6 = ""
			is_pressed = false
