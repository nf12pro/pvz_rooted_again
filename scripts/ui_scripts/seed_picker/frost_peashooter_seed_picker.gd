extends Button

var frost_pea_is_pressed: bool = false

#region frost_pea Picking
func _on_frost_pea_picker_pressed() -> void:
	if Global.frost_pea_unlocked == false:
		print("You Need To Unlock Frost Pea Wood")
	else:
		if Global.amount_of_seeds < 6:
			if frost_pea_is_pressed == false:
				$".".modulate.a = 0.5
				if Global.new_open_slot == false:
					Global.frost_pea_selected = true
					Global.amount_of_seeds += 1
					if Global.amount_of_seeds == 1:
							Global.seed_1 = "Frost Pea"
							Global.slot_of_frost_pea = 1
					elif Global.amount_of_seeds == 2:
						Global.seed_2 = "Frost Pea"
						Global.slot_of_frost_pea = 2
					elif Global.amount_of_seeds == 3:
						Global.seed_3 = "Frost Pea"
						Global.slot_of_frost_pea = 3
					elif Global.amount_of_seeds == 4:
						Global.seed_4 = "Frost Pea"
						Global.slot_of_frost_pea = 4
					elif Global.amount_of_seeds == 5:
						Global.seed_5 = "Frost Pea"
						Global.slot_of_frost_pea = 5
					elif Global.amount_of_seeds == 6:
						Global.seed_6 = "Frost Pea"
						Global.slot_of_frost_pea = 6
				elif Global.new_open_slot == true:
					Global.frost_pea_selected = true
					Global.amount_of_seeds += 1
					if Global.open_slot == 1:
						Global.seed_1 = "Frost Pea"
						Global.slot_of_frost_pea = 1
					elif Global.open_slot == 2:
						Global.seed_2 = "Frost Pea"
						Global.slot_of_frost_pea = 2
					elif Global.open_slot == 3:
						Global.seed_3 = "Frost Pea"
						Global.slot_of_frost_pea = 3
					elif Global.open_slot == 4:
						Global.seed_4 = "Frost Pea"
						Global.slot_of_frost_pea = 4
					elif Global.open_slot == 5:
						Global.seed_5 = "Frost Pea"
						Global.slot_of_frost_pea = 5
					elif Global.open_slot == 6:
						Global.seed_6 = "Frost Pea"
						Global.slot_of_frost_pea = 6
					Global.new_open_slot = false
					Global.open_slot = 0
				frost_pea_is_pressed = true
			
			elif frost_pea_is_pressed == true:
				$".".modulate.a = 1
				Global.frost_pea_selected = false
				Global.amount_of_seeds -= 1
				print("test")
				if Global.slot_of_frost_pea == 1:
					Global.seed_1 = ""
					Global.slot_of_frost_pea = 0
					Global.open_slot = 1
				elif Global.slot_of_frost_pea == 2:
					Global.seed_2 = ""
					Global.slot_of_frost_pea = 0
					Global.open_slot = 2
				elif Global.slot_of_frost_pea == 3:
					Global.seed_3 = ""
					Global.slot_of_frost_pea = 0
					Global.open_slot = 3
				elif Global.slot_of_frost_pea == 4:
					Global.seed_4 = ""
					Global.slot_of_frost_pea = 0
					Global.open_slot = 4
				elif Global.slot_of_frost_pea == 5:
					Global.seed_5 = ""
					Global.slot_of_frost_pea = 0
					Global.open_slot = 5
				elif Global.slot_of_frost_pea == 6:
					Global.seed_6 = ""
					Global.slot_of_frost_pea = 0
					Global.open_slot = 6
				frost_pea_is_pressed = false
				Global.new_open_slot = true
		else:
			if frost_pea_is_pressed == true:
				$".".modulate.a = 1
				Global.frost_pea_selected = false
				Global.amount_of_seeds -= 1
				print("test")
				if Global.slot_of_frost_pea == 1:
					Global.seed_1 = ""
					Global.slot_of_frost_pea = 0
					Global.open_slot = 1
				elif Global.slot_of_frost_pea == 2:
					Global.seed_2 = ""
					Global.slot_of_frost_pea = 0
					Global.open_slot = 2
				elif Global.slot_of_frost_pea == 3:
					Global.seed_3 = ""
					Global.slot_of_frost_pea = 0
					Global.open_slot = 3
				elif Global.slot_of_frost_pea == 4:
					Global.seed_4 = ""
					Global.slot_of_frost_pea = 0
					Global.open_slot = 4
				elif Global.slot_of_frost_pea == 5:
					Global.seed_5 = ""
					Global.slot_of_frost_pea = 0
					Global.open_slot = 5
				elif Global.slot_of_frost_pea == 6:
					Global.seed_6 = ""
					Global.slot_of_frost_pea = 0
					Global.open_slot = 6
				frost_pea_is_pressed = false
				Global.new_open_slot = true
#endregion

func _process(_delta: float) -> void:
	if Global.frost_pea_selected == true:
		frost_pea_is_pressed = true
		$".".modulate.a = 0.5
	else:
		$".".modulate.a = 1
		frost_pea_is_pressed = false
