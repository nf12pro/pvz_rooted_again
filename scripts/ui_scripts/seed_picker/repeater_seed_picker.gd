extends Button

var repeater_is_pressed: bool = false

#region repeater Picking
func _on_repeater_picker_pressed() -> void:
	if Global.amount_of_seeds < 6:
		if repeater_is_pressed == false:
			$".".modulate.a = 0.5
			if Global.new_open_slot == false:
				Global.repeater_selected = true
				Global.amount_of_seeds += 1
				if Global.amount_of_seeds == 1:
						Global.seed_1 = "Repeater"
						Global.slot_of_repeater = 1
				elif Global.amount_of_seeds == 2:
					Global.seed_2 = "Repeater"
					Global.slot_of_repeater = 2
				elif Global.amount_of_seeds == 3:
					Global.seed_3 = "Repeater"
					Global.slot_of_repeater = 3
				elif Global.amount_of_seeds == 4:
					Global.seed_4 = "Repeater"
					Global.slot_of_repeater = 4
				elif Global.amount_of_seeds == 5:
					Global.seed_5 = "Repeater"
					Global.slot_of_repeater = 5
				elif Global.amount_of_seeds == 6:
					Global.seed_6 = "Repeater"
					Global.slot_of_repeater = 6
			elif Global.new_open_slot == true:
				Global.repeater_selected = true
				Global.amount_of_seeds += 1
				if Global.open_slot == 1:
					Global.seed_1 = "Repeater"
					Global.slot_of_repeater = 1
				elif Global.open_slot == 2:
					Global.seed_2 = "Repeater"
					Global.slot_of_repeater = 2
				elif Global.open_slot == 3:
					Global.seed_3 = "Repeater"
					Global.slot_of_repeater = 3
				elif Global.open_slot == 4:
					Global.seed_4 = "Repeater"
					Global.slot_of_repeater = 4
				elif Global.open_slot == 5:
					Global.seed_5 = "Repeater"
					Global.slot_of_repeater = 5
				elif Global.open_slot == 6:
					Global.seed_6 = "Repeater"
					Global.slot_of_repeater = 6
				Global.new_open_slot = false
				Global.open_slot = 0
			repeater_is_pressed = true
		
		elif repeater_is_pressed == true:
			$".".modulate.a = 1
			Global.repeater_selected = false
			Global.amount_of_seeds -= 1
			print("test")
			if Global.slot_of_repeater == 1:
				Global.seed_1 = ""
				Global.slot_of_repeater = 0
				Global.open_slot = 1
			elif Global.slot_of_repeater == 2:
				Global.seed_2 = ""
				Global.slot_of_repeater = 0
				Global.open_slot = 2
			elif Global.slot_of_repeater == 3:
				Global.seed_3 = ""
				Global.slot_of_repeater = 0
				Global.open_slot = 3
			elif Global.slot_of_repeater == 4:
				Global.seed_4 = ""
				Global.slot_of_repeater = 0
				Global.open_slot = 4
			elif Global.slot_of_repeater == 5:
				Global.seed_5 = ""
				Global.slot_of_repeater = 0
				Global.open_slot = 5
			elif Global.slot_of_repeater == 6:
				Global.seed_6 = ""
				Global.slot_of_repeater = 0
				Global.open_slot = 6
			repeater_is_pressed = false
			Global.new_open_slot = true
	else:
		if repeater_is_pressed == true:
			$".".modulate.a = 1
			Global.repeater_selected = false
			Global.amount_of_seeds -= 1
			print("test")
			if Global.slot_of_repeater == 1:
				Global.seed_1 = ""
				Global.slot_of_repeater = 0
				Global.open_slot = 1
			elif Global.slot_of_repeater == 2:
				Global.seed_2 = ""
				Global.slot_of_repeater = 0
				Global.open_slot = 2
			elif Global.slot_of_repeater == 3:
				Global.seed_3 = ""
				Global.slot_of_repeater = 0
				Global.open_slot = 3
			elif Global.slot_of_repeater == 4:
				Global.seed_4 = ""
				Global.slot_of_repeater = 0
				Global.open_slot = 4
			elif Global.slot_of_repeater == 5:
				Global.seed_5 = ""
				Global.slot_of_repeater = 0
				Global.open_slot = 5
			elif Global.slot_of_repeater == 6:
				Global.seed_6 = ""
				Global.slot_of_repeater = 0
				Global.open_slot = 6
			repeater_is_pressed = false
			Global.new_open_slot = true
#endregion

func _process(_delta: float) -> void:
	if Global.repeater_selected == true:
		repeater_is_pressed = true
		$".".modulate.a = 0.5
	else:
		$".".modulate.a = 1
		repeater_is_pressed = false
