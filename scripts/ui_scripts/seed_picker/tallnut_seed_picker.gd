extends Button

var tall_nut_is_pressed: bool = false

#region tall_nut Picking
func _on_tall_nut_picker_pressed() -> void:
	if Global.tall_nut_unlocked == false:
		print("You Need To Unlock Tall Nut")
	else:
		if Global.amount_of_seeds < 6:
			$".".modulate.a = 0.5
			if tall_nut_is_pressed == false:
				if Global.new_open_slot == false:
					Global.tall_nut_selected = true
					Global.amount_of_seeds += 1
					if Global.amount_of_seeds == 1:
						Global.seed_1 = "Tall Nut"
						Global.slot_of_tall_nut = 1
					elif Global.amount_of_seeds == 2:
						Global.seed_2 = "Tall Nut"
						Global.slot_of_tall_nut = 2
					elif Global.amount_of_seeds == 3:
						Global.seed_3 = "Tall Nut"
						Global.slot_of_tall_nut = 3
					elif Global.amount_of_seeds == 4:
						Global.seed_4 = "Tall Nut"
						Global.slot_of_tall_nut = 4
					elif Global.amount_of_seeds == 5:
						Global.seed_5 = "Tall Nut"
						Global.slot_of_tall_nut = 5
					elif Global.amount_of_seeds == 6:
						Global.seed_6 = "Tall Nut"
						Global.slot_of_tall_nut = 6
				elif Global.new_open_slot == true:
					Global.tall_nut_selected = true
					Global.amount_of_seeds += 1
					if Global.open_slot == 1:
						Global.seed_1 = "Tall Nut"
						Global.slot_of_tall_nut = 1
					elif Global.open_slot == 2:
						Global.seed_2 = "Tall Nut"
						Global.slot_of_tall_nut = 2
					elif Global.open_slot == 3:
						Global.seed_3 = "Tall Nut"
						Global.slot_of_tall_nut = 3
					elif Global.open_slot == 4:
						Global.seed_4 = "Tall Nut"
						Global.slot_of_tall_nut = 4
					elif Global.open_slot == 5:
						Global.seed_5 = "Tall Nut"
						Global.slot_of_tall_nut = 5
					elif Global.open_slot == 6:
						Global.seed_6 = "Tall Nut"
						Global.slot_of_tall_nut = 6
					Global.new_open_slot = false
					Global.open_slot = 0
				tall_nut_is_pressed = true
			
			elif tall_nut_is_pressed == true:
				$".".modulate.a = 1
				Global.tall_nut_selected = false
				Global.amount_of_seeds -= 1
				print("test")
				if Global.slot_of_tall_nut == 1:
					Global.seed_1 = ""
					Global.slot_of_tall_nut = 0
					Global.open_slot = 1
				elif Global.slot_of_tall_nut == 2:
					Global.seed_2 = ""
					Global.slot_of_tall_nut = 0
					Global.open_slot = 2
				elif Global.slot_of_tall_nut == 3:
					Global.seed_3 = ""
					Global.slot_of_tall_nut = 0
					Global.open_slot = 3
				elif Global.slot_of_tall_nut == 4:
					Global.seed_4 = ""
					Global.slot_of_tall_nut = 0
					Global.open_slot = 4
				elif Global.slot_of_tall_nut == 5:
					Global.seed_5 = ""
					Global.slot_of_tall_nut = 0
					Global.open_slot = 5
				elif Global.slot_of_tall_nut == 6:
					Global.seed_6 = ""
					Global.slot_of_tall_nut = 0
					Global.open_slot = 6
				tall_nut_is_pressed = false
				Global.new_open_slot = true
		else:
			if tall_nut_is_pressed == true:
				$".".modulate.a = 1
				Global.tall_nut_selected = false
				Global.amount_of_seeds -= 1
				print("test")
				if Global.slot_of_tall_nut == 1:
					Global.seed_1 = ""
					Global.slot_of_tall_nut = 0
					Global.open_slot = 1
				elif Global.slot_of_tall_nut == 2:
					Global.seed_2 = ""
					Global.slot_of_tall_nut = 0
					Global.open_slot = 2
				elif Global.slot_of_tall_nut == 3:
					Global.seed_3 = ""
					Global.slot_of_tall_nut = 0
					Global.open_slot = 3
				elif Global.slot_of_tall_nut == 4:
					Global.seed_4 = ""
					Global.slot_of_tall_nut = 0
					Global.open_slot = 4
				elif Global.slot_of_tall_nut == 5:
					Global.seed_5 = ""
					Global.slot_of_tall_nut = 0
					Global.open_slot = 5
				elif Global.slot_of_tall_nut == 6:
					Global.seed_6 = ""
					Global.slot_of_tall_nut = 0
					Global.open_slot = 6
				tall_nut_is_pressed = false
				Global.new_open_slot = true
#endregion

func _process(_delta: float) -> void:
	if Global.tall_nut_selected == true:
		tall_nut_is_pressed = true
		$".".modulate.a = 0.5
	else:
		$".".modulate.a = 1
		tall_nut_is_pressed = false
