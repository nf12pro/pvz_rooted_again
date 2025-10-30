extends Button

var plasma_wood_is_pressed: bool = false

#region plasma_wood Picking
func _on_plasma_wood_picker_pressed() -> void:
	if Global.plasma_wood_unlocked == false:
		print("You Need To Unlock Plasma Wood")
	else:
		if Global.amount_of_seeds < 6:
			if plasma_wood_is_pressed == false:
				$".".modulate.a = 0.5
				if Global.new_open_slot == false:
					Global.plasma_wood_selected = true
					Global.amount_of_seeds += 1
					if Global.amount_of_seeds == 1:
							Global.seed_1 = "Plasma Wood"
							Global.slot_of_plasma_wood = 1
					elif Global.amount_of_seeds == 2:
						Global.seed_2 = "Plasma Wood"
						Global.slot_of_plasma_wood = 2
					elif Global.amount_of_seeds == 3:
						Global.seed_3 = "Plasma Wood"
						Global.slot_of_plasma_wood = 3
					elif Global.amount_of_seeds == 4:
						Global.seed_4 = "Plasma Wood"
						Global.slot_of_plasma_wood = 4
					elif Global.amount_of_seeds == 5:
						Global.seed_5 = "Plasma Wood"
						Global.slot_of_plasma_wood = 5
					elif Global.amount_of_seeds == 6:
						Global.seed_6 = "Plasma Wood"
						Global.slot_of_plasma_wood = 6
				elif Global.new_open_slot == true:
					Global.plasma_wood_selected = true
					Global.amount_of_seeds += 1
					if Global.open_slot == 1:
						Global.seed_1 = "Plasma Wood"
						Global.slot_of_plasma_wood = 1
					elif Global.open_slot == 2:
						Global.seed_2 = "Plasma Wood"
						Global.slot_of_plasma_wood = 2
					elif Global.open_slot == 3:
						Global.seed_3 = "Plasma Wood"
						Global.slot_of_plasma_wood = 3
					elif Global.open_slot == 4:
						Global.seed_4 = "Plasma Wood"
						Global.slot_of_plasma_wood = 4
					elif Global.open_slot == 5:
						Global.seed_5 = "Plasma Wood"
						Global.slot_of_plasma_wood = 5
					elif Global.open_slot == 6:
						Global.seed_6 = "Plasma Wood"
						Global.slot_of_plasma_wood = 6
					Global.new_open_slot = false
					Global.open_slot = 0
				plasma_wood_is_pressed = true
			
			elif plasma_wood_is_pressed == true:
				$".".modulate.a = 1
				Global.plasma_wood_selected = false
				Global.amount_of_seeds -= 1
				print("test")
				if Global.slot_of_plasma_wood == 1:
					Global.seed_1 = ""
					Global.slot_of_plasma_wood = 0
					Global.open_slot = 1
				elif Global.slot_of_plasma_wood == 2:
					Global.seed_2 = ""
					Global.slot_of_plasma_wood = 0
					Global.open_slot = 2
				elif Global.slot_of_plasma_wood == 3:
					Global.seed_3 = ""
					Global.slot_of_plasma_wood = 0
					Global.open_slot = 3
				elif Global.slot_of_plasma_wood == 4:
					Global.seed_4 = ""
					Global.slot_of_plasma_wood = 0
					Global.open_slot = 4
				elif Global.slot_of_plasma_wood == 5:
					Global.seed_5 = ""
					Global.slot_of_plasma_wood = 0
					Global.open_slot = 5
				elif Global.slot_of_plasma_wood == 6:
					Global.seed_6 = ""
					Global.slot_of_plasma_wood = 0
					Global.open_slot = 6
				plasma_wood_is_pressed = false
				Global.new_open_slot = true
		else:
			if plasma_wood_is_pressed == true:
				$".".modulate.a = 1
				Global.plasma_wood_selected = false
				Global.amount_of_seeds -= 1
				print("test")
				if Global.slot_of_plasma_wood == 1:
					Global.seed_1 = ""
					Global.slot_of_plasma_wood = 0
					Global.open_slot = 1
				elif Global.slot_of_plasma_wood == 2:
					Global.seed_2 = ""
					Global.slot_of_plasma_wood = 0
					Global.open_slot = 2
				elif Global.slot_of_plasma_wood == 3:
					Global.seed_3 = ""
					Global.slot_of_plasma_wood = 0
					Global.open_slot = 3
				elif Global.slot_of_plasma_wood == 4:
					Global.seed_4 = ""
					Global.slot_of_plasma_wood = 0
					Global.open_slot = 4
				elif Global.slot_of_plasma_wood == 5:
					Global.seed_5 = ""
					Global.slot_of_plasma_wood = 0
					Global.open_slot = 5
				elif Global.slot_of_plasma_wood == 6:
					Global.seed_6 = ""
					Global.slot_of_plasma_wood = 0
					Global.open_slot = 6
				plasma_wood_is_pressed = false
				Global.new_open_slot = true
#endregion

func _process(_delta: float) -> void:
	if Global.plasma_wood_selected == true:
		plasma_wood_is_pressed = true
		$".".modulate.a = 0.5
	else:
		$".".modulate.a = 1
		plasma_wood_is_pressed = false
