extends Button

var gatling_gun_is_pressed: bool = false

#region gatling_gun Picking
func _on_gatling_gun_picker_pressed() -> void:
	if Global.gatling_gun_unlocked == false:
		print("You Need To Unlock Gatling Gun Wood")
	else:
		if Global.amount_of_seeds < 6:
			if gatling_gun_is_pressed == false:
				$".".modulate.a = 0.5
				if Global.new_open_slot == false:
					Global.gatling_gun_selected = true
					Global.amount_of_seeds += 1
					if Global.amount_of_seeds == 1:
							Global.seed_1 = "Gatling Gun"
							Global.slot_of_gatling_gun = 1
					elif Global.amount_of_seeds == 2:
						Global.seed_2 = "Gatling Gun"
						Global.slot_of_gatling_gun = 2
					elif Global.amount_of_seeds == 3:
						Global.seed_3 = "Gatling Gun"
						Global.slot_of_gatling_gun = 3
					elif Global.amount_of_seeds == 4:
						Global.seed_4 = "Gatling Gun"
						Global.slot_of_gatling_gun = 4
					elif Global.amount_of_seeds == 5:
						Global.seed_5 = "Gatling Gun"
						Global.slot_of_gatling_gun = 5
					elif Global.amount_of_seeds == 6:
						Global.seed_6 = "Gatling Gun"
						Global.slot_of_gatling_gun = 6
				elif Global.new_open_slot == true:
					Global.gatling_gun_selected = true
					Global.amount_of_seeds += 1
					if Global.open_slot == 1:
						Global.seed_1 = "Gatling Gun"
						Global.slot_of_gatling_gun = 1
					elif Global.open_slot == 2:
						Global.seed_2 = "Gatling Gun"
						Global.slot_of_gatling_gun = 2
					elif Global.open_slot == 3:
						Global.seed_3 = "Gatling Gun"
						Global.slot_of_gatling_gun = 3
					elif Global.open_slot == 4:
						Global.seed_4 = "Gatling Gun"
						Global.slot_of_gatling_gun = 4
					elif Global.open_slot == 5:
						Global.seed_5 = "Gatling Gun"
						Global.slot_of_gatling_gun = 5
					elif Global.open_slot == 6:
						Global.seed_6 = "Gatling Gun"
						Global.slot_of_gatling_gun = 6
					Global.new_open_slot = false
					Global.open_slot = 0
				gatling_gun_is_pressed = true
			
			elif gatling_gun_is_pressed == true:
				$".".modulate.a = 1
				Global.gatling_gun_selected = false
				Global.amount_of_seeds -= 1
				print("test")
				if Global.slot_of_gatling_gun == 1:
					Global.seed_1 = ""
					Global.slot_of_gatling_gun = 0
					Global.open_slot = 1
				elif Global.slot_of_gatling_gun == 2:
					Global.seed_2 = ""
					Global.slot_of_gatling_gun = 0
					Global.open_slot = 2
				elif Global.slot_of_gatling_gun == 3:
					Global.seed_3 = ""
					Global.slot_of_gatling_gun = 0
					Global.open_slot = 3
				elif Global.slot_of_gatling_gun == 4:
					Global.seed_4 = ""
					Global.slot_of_gatling_gun = 0
					Global.open_slot = 4
				elif Global.slot_of_gatling_gun == 5:
					Global.seed_5 = ""
					Global.slot_of_gatling_gun = 0
					Global.open_slot = 5
				elif Global.slot_of_gatling_gun == 6:
					Global.seed_6 = ""
					Global.slot_of_gatling_gun = 0
					Global.open_slot = 6
				gatling_gun_is_pressed = false
				Global.new_open_slot = true
		else:
			if gatling_gun_is_pressed == true:
				$".".modulate.a = 1
				Global.gatling_gun_selected = false
				Global.amount_of_seeds -= 1
				print("test")
				if Global.slot_of_gatling_gun == 1:
					Global.seed_1 = ""
					Global.slot_of_gatling_gun = 0
					Global.open_slot = 1
				elif Global.slot_of_gatling_gun == 2:
					Global.seed_2 = ""
					Global.slot_of_gatling_gun = 0
					Global.open_slot = 2
				elif Global.slot_of_gatling_gun == 3:
					Global.seed_3 = ""
					Global.slot_of_gatling_gun = 0
					Global.open_slot = 3
				elif Global.slot_of_gatling_gun == 4:
					Global.seed_4 = ""
					Global.slot_of_gatling_gun = 0
					Global.open_slot = 4
				elif Global.slot_of_gatling_gun == 5:
					Global.seed_5 = ""
					Global.slot_of_gatling_gun = 0
					Global.open_slot = 5
				elif Global.slot_of_gatling_gun == 6:
					Global.seed_6 = ""
					Global.slot_of_gatling_gun = 0
					Global.open_slot = 6
				gatling_gun_is_pressed = false
				Global.new_open_slot = true
#endregion

func _process(_delta: float) -> void:
	if Global.gatling_gun_selected == true:
		gatling_gun_is_pressed = true
		$".".modulate.a = 0.5
	else:
		$".".modulate.a = 1
		gatling_gun_is_pressed = false
