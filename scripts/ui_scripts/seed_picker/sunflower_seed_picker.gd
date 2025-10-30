extends Button

var sunflower_is_pressed: bool = false


#region sunflower Picking
func _on_sunflower_picker_pressed() -> void:
	if Global.amount_of_seeds < 6:
		if sunflower_is_pressed == false:
			$".".modulate.a = 0.5
			if Global.new_open_slot == false:
				Global.sunflower_selected = true
				Global.amount_of_seeds += 1
				if Global.amount_of_seeds == 1:
						Global.seed_1 = "Sunflower"
						Global.slot_of_sunflower = 1
				elif Global.amount_of_seeds == 2:
					Global.seed_2 = "Sunflower"
					Global.slot_of_sunflower = 2
				elif Global.amount_of_seeds == 3:
					Global.seed_3 = "Sunflower"
					Global.slot_of_sunflower = 3
				elif Global.amount_of_seeds == 4:
					Global.seed_4 = "Sunflower"
					Global.slot_of_sunflower = 4
				elif Global.amount_of_seeds == 5:
					Global.seed_5 = "Sunflower"
					Global.slot_of_sunflower = 5
				elif Global.amount_of_seeds == 6:
					Global.seed_6 = "Sunflower"
					Global.slot_of_sunflower = 6
			elif Global.new_open_slot == true:
				Global.sunflower_selected = true
				Global.amount_of_seeds += 1
				if Global.open_slot == 1:
					Global.seed_1 = "Sunflower"
					Global.slot_of_sunflower = 1
				elif Global.open_slot == 2:
					Global.seed_2 = "Sunflower"
					Global.slot_of_sunflower = 2
				elif Global.open_slot == 3:
					Global.seed_3 = "Sunflower"
					Global.slot_of_sunflower = 3
				elif Global.open_slot == 4:
					Global.seed_4 = "Sunflower"
					Global.slot_of_sunflower = 4
				elif Global.open_slot == 5:
					Global.seed_5 = "Sunflower"
					Global.slot_of_sunflower = 5
				elif Global.open_slot == 6:
					Global.seed_6 = "Sunflower"
					Global.slot_of_sunflower = 6
				Global.new_open_slot = false
				Global.open_slot = 0
			sunflower_is_pressed = true
		
		elif sunflower_is_pressed == true:
			$".".modulate.a = 1
			Global.sunflower_selected = false
			Global.amount_of_seeds -= 1
			print("test")
			if Global.slot_of_sunflower == 1:
				Global.seed_1 = ""
				Global.slot_of_sunflower = 0
				Global.open_slot = 1
			elif Global.slot_of_sunflower == 2:
				Global.seed_2 = ""
				Global.slot_of_sunflower = 0
				Global.open_slot = 2
			elif Global.slot_of_sunflower == 3:
				Global.seed_3 = ""
				Global.slot_of_sunflower = 0
				Global.open_slot = 3
			elif Global.slot_of_sunflower == 4:
				Global.seed_4 = ""
				Global.slot_of_sunflower = 0
				Global.open_slot = 4
			elif Global.slot_of_sunflower == 5:
				Global.seed_5 = ""
				Global.slot_of_sunflower = 0
				Global.open_slot = 5
			elif Global.slot_of_sunflower == 6:
				Global.seed_6 = ""
				Global.slot_of_sunflower = 0
				Global.open_slot = 6
			sunflower_is_pressed = false
			Global.new_open_slot = true
	else:
		if sunflower_is_pressed == true:
			$".".modulate.a = 1
			Global.sunflower_selected = false
			Global.amount_of_seeds -= 1
			print("test")
			if Global.slot_of_sunflower == 1:
				Global.seed_1 = ""
				Global.slot_of_sunflower = 0
				Global.open_slot = 1
			elif Global.slot_of_sunflower == 2:
				Global.seed_2 = ""
				Global.slot_of_sunflower = 0
				Global.open_slot = 2
			elif Global.slot_of_sunflower == 3:
				Global.seed_3 = ""
				Global.slot_of_sunflower = 0
				Global.open_slot = 3
			elif Global.slot_of_sunflower == 4:
				Global.seed_4 = ""
				Global.slot_of_sunflower = 0
				Global.open_slot = 4
			elif Global.slot_of_sunflower == 5:
				Global.seed_5 = ""
				Global.slot_of_sunflower = 0
				Global.open_slot = 5
			elif Global.slot_of_sunflower == 6:
				Global.seed_6 = ""
				Global.slot_of_sunflower = 0
				Global.open_slot = 6
			sunflower_is_pressed = false
			Global.new_open_slot = true
#endregion

func _process(_delta: float) -> void:
	if Global.sunflower_selected == true:
		sunflower_is_pressed = true
		$".".modulate.a = 0.5
	else:
		$".".modulate.a = 1
		sunflower_is_pressed = false
