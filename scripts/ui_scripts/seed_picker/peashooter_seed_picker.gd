extends Button

var peashooter_is_pressed: bool = false

#region peashooter Picking
func _on_peashooter_picker_pressed() -> void:
	if Global.amount_of_seeds < Global.max_amount_seeds:
		if peashooter_is_pressed == false:
			$".".modulate.a = 0.5
			if Global.is_new_open_slot == false:
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
			elif Global.is_new_open_slot == true:
				Global.peashooter_selected = true
				Global.amount_of_seeds += 1
				if Global.new_open_slot:
					Global.seed_1 = "Peashooter"
					Global.slot_of_peashooter = 1
					Global.new_open_slot = false
				elif Global.new_open_slot_2:
					Global.seed_2 = "Peashooter"
					Global.slot_of_peashooter = 2
					Global.new_open_slot_2 = false
				elif Global.new_open_slot_3:
					Global.seed_3 = "Peashooter"
					Global.slot_of_peashooter = 3
					Global.new_open_slot_3 = false
				elif Global.new_open_slot_4:
					Global.seed_4 = "Peashooter"
					Global.slot_of_peashooter = 4
					Global.new_open_slot_4 = false
				elif Global.new_open_slot_5:
					Global.seed_5 = "Peashooter"
					Global.slot_of_peashooter = 5
					Global.new_open_slot_5 = false
			peashooter_is_pressed = true
		
		elif peashooter_is_pressed == true:
			$".".modulate.a = 1
			Global.peashooter_selected = false
			Global.amount_of_seeds -= 1
			print("test")
			if Global.slot_of_peashooter == 1:
				Global.seed_1 = ""
				Global.slot_of_peashooter = 0
				Global.new_open_slot = true
			elif Global.slot_of_peashooter == 2:
				Global.seed_2 = ""
				Global.slot_of_peashooter = 0
				Global.new_open_slot_2 = true
			elif Global.slot_of_peashooter == 3:
				Global.seed_3 = ""
				Global.slot_of_peashooter = 0
				Global.new_open_slot_3 = true
			elif Global.slot_of_peashooter == 4:
				Global.seed_4 = ""
				Global.slot_of_peashooter = 0
				Global.new_open_slot_4 = true
			elif Global.slot_of_peashooter == 5:
				Global.seed_5 = ""
				Global.slot_of_peashooter = 0
				Global.new_open_slot_5 = true
			peashooter_is_pressed = false
	else:
		if peashooter_is_pressed == true:
			$".".modulate.a = 1
			Global.peashooter_selected = false
			Global.amount_of_seeds -= 1
			print("test")
			if Global.slot_of_peashooter == 1:
				Global.seed_1 = ""
				Global.slot_of_peashooter = 0
				Global.new_open_slot = true
			elif Global.slot_of_peashooter == 2:
				Global.seed_2 = ""
				Global.slot_of_peashooter = 0
				Global.new_open_slot_2 = true
			elif Global.slot_of_peashooter == 3:
				Global.seed_3 = ""
				Global.slot_of_peashooter = 0
				Global.new_open_slot_3 = true
			elif Global.slot_of_peashooter == 4:
				Global.seed_4 = ""
				Global.slot_of_peashooter = 0
				Global.new_open_slot_4 = true
			elif Global.slot_of_peashooter == 5:
				Global.seed_5 = ""
				Global.slot_of_peashooter = 0
				Global.new_open_slot_5 = true
			peashooter_is_pressed = false
#endregion

func _process(_delta: float) -> void:
	if Global.peashooter_selected == true:
		peashooter_is_pressed = true
		$".".modulate.a = 0.5
	else:
		$".".modulate.a = 1
		peashooter_is_pressed = false
