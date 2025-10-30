extends Button

var peashooter_is_pressed: bool = false

#region peashooter Picking
func _on_peashooter_picker_pressed() -> void:
	if Global.amount_of_seeds < 6:
		$".".modulate.a = 0.5
		if peashooter_is_pressed == false:
			if Global.new_open_slot == false:
				Global.peashooter_selected = true
				Global.amount_of_seeds += 1
				if Global.amount_of_seeds == 1:
						Global.seed_1 = "Peashooter"
						Global.slot_of_peashooter = 1
				elif Global.amount_of_seeds == 2:
					Global.seed_2 = "Peashooter"
					Global.slot_of_peashooter = 2
				elif Global.amount_of_seeds == 3:
					Global.seed_3 = "Peashooter"
					Global.slot_of_peashooter = 3
				elif Global.amount_of_seeds == 4:
					Global.seed_4 = "Peashooter"
					Global.slot_of_peashooter = 4
				elif Global.amount_of_seeds == 5:
					Global.seed_5 = "Peashooter"
					Global.slot_of_peashooter = 5
				elif Global.amount_of_seeds == 6:
					Global.seed_6 = "Peashooter"
					Global.slot_of_peashooter = 6
			elif Global.new_open_slot == true:
				Global.peashooter_selected = true
				Global.amount_of_seeds += 1
				if Global.open_slot == 1:
					Global.seed_1 = "Peashooter"
					Global.slot_of_peashooter = 1
				elif Global.open_slot == 2:
					Global.seed_2 = "Peashooter"
					Global.slot_of_peashooter = 2
				elif Global.open_slot == 3:
					Global.seed_3 = "Peashooter"
					Global.slot_of_peashooter = 3
				elif Global.open_slot == 4:
					Global.seed_4 = "Peashooter"
					Global.slot_of_peashooter = 4
				elif Global.open_slot == 5:
					Global.seed_5 = "Peashooter"
					Global.slot_of_peashooter = 5
				elif Global.open_slot == 6:
					Global.seed_6 = "Peashooter"
					Global.slot_of_peashooter = 6
				Global.new_open_slot = false
				Global.open_slot = 0
			peashooter_is_pressed = true
		
		elif peashooter_is_pressed == true:
			$".".modulate.a = 1
			Global.peashooter_selected = false
			Global.amount_of_seeds -= 1
			print("test")
			if Global.slot_of_peashooter == 1:
				Global.seed_1 = ""
				Global.slot_of_peashooter = 0
				Global.open_slot = 1
			elif Global.slot_of_peashooter == 2:
				Global.seed_2 = ""
				Global.slot_of_peashooter = 0
				Global.open_slot = 2
			elif Global.slot_of_peashooter == 3:
				Global.seed_3 = ""
				Global.slot_of_peashooter = 0
				Global.open_slot = 3
			elif Global.slot_of_peashooter == 4:
				Global.seed_4 = ""
				Global.slot_of_peashooter = 0
				Global.open_slot = 4
			elif Global.slot_of_peashooter == 5:
				Global.seed_5 = ""
				Global.slot_of_peashooter = 0
				Global.open_slot = 5
			elif Global.slot_of_peashooter == 6:
				Global.seed_6 = ""
				Global.slot_of_peashooter = 0
				Global.open_slot = 6
			peashooter_is_pressed = false
			Global.new_open_slot = true
	else:
		if peashooter_is_pressed == true:
			$".".modulate.a = 1
			Global.peashooter_selected = false
			Global.amount_of_seeds -= 1
			print("test")
			if Global.slot_of_peashooter == 1:
				Global.seed_1 = ""
				Global.slot_of_peashooter = 0
				Global.open_slot = 1
			elif Global.slot_of_peashooter == 2:
				Global.seed_2 = ""
				Global.slot_of_peashooter = 0
				Global.open_slot = 2
			elif Global.slot_of_peashooter == 3:
				Global.seed_3 = ""
				Global.slot_of_peashooter = 0
				Global.open_slot = 3
			elif Global.slot_of_peashooter == 4:
				Global.seed_4 = ""
				Global.slot_of_peashooter = 0
				Global.open_slot = 4
			elif Global.slot_of_peashooter == 5:
				Global.seed_5 = ""
				Global.slot_of_peashooter = 0
				Global.open_slot = 5
			elif Global.slot_of_peashooter == 6:
				Global.seed_6 = ""
				Global.slot_of_peashooter = 0
				Global.open_slot = 6
			peashooter_is_pressed = false
			Global.new_open_slot = true
#endregion

func _process(_delta: float) -> void:
	if Global.peashooter_selected == true:
		peashooter_is_pressed = true
		$".".modulate.a = 0.5
	else:
		$".".modulate.a = 1
		peashooter_is_pressed = false
