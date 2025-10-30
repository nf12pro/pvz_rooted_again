extends Button

var doomshroom_is_pressed: bool = false

#region doomshroom Picking
func _on_doomshroom_picker_pressed() -> void:
	if Global.amount_of_seeds < 6:
		if doomshroom_is_pressed == false:
			$".".modulate.a = 0.5
			if Global.new_open_slot == false:
				Global.doomshroom_selected = true
				Global.amount_of_seeds += 1
				if Global.amount_of_seeds == 1:
					Global.seed_1 = "Doom Shroom"
					Global.slot_of_doomshroom = 1
				elif Global.amount_of_seeds == 2:
					Global.seed_2 = "Doom Shroom"
					Global.slot_of_doomshroom = 2
				elif Global.amount_of_seeds == 3:
					Global.seed_3 = "Doom Shroom"
					Global.slot_of_doomshroom = 3
				elif Global.amount_of_seeds == 4:
					Global.seed_4 = "Doom Shroom"
					Global.slot_of_doomshroom = 4
				elif Global.amount_of_seeds == 5:
					Global.seed_5 = "Doom Shroom"
					Global.slot_of_doomshroom = 5
				elif Global.amount_of_seeds == 6:
					Global.seed_6 = "Doom Shroom"
					Global.slot_of_doomshroom = 6
			elif Global.new_open_slot == true:
				Global.doomshroom_selected = true
				Global.amount_of_seeds += 1
				if Global.open_slot == 1:
					Global.seed_1 = "Doom Shroom"
					Global.slot_of_doomshroom = 1
				elif Global.open_slot == 2:
					Global.seed_2 = "Doom Shroom"
					Global.slot_of_doomshroom = 2
				elif Global.open_slot == 3:
					Global.seed_3 = "Doom Shroom"
					Global.slot_of_doomshroom = 3
				elif Global.open_slot == 4:
					Global.seed_4 = "Doom Shroom"
					Global.slot_of_doomshroom = 4
				elif Global.open_slot == 5:
					Global.seed_5 = "Doom Shroom"
					Global.slot_of_doomshroom = 5
				elif Global.open_slot == 6:
					Global.seed_6 = "Doom Shroom"
					Global.slot_of_doomshroom = 6
				Global.new_open_slot = false
				Global.open_slot = 0
			doomshroom_is_pressed = true
		
		elif doomshroom_is_pressed == true:
			$".".modulate.a = 1
			Global.doomshroom_selected = false
			Global.amount_of_seeds -= 1
			if Global.slot_of_doomshroom == 1:
				Global.seed_1 = ""
				Global.slot_of_doomshroom = 0
				Global.open_slot = 1
			elif Global.slot_of_doomshroom == 2:
				Global.seed_2 = ""
				Global.slot_of_doomshroom = 0
				Global.open_slot = 2
			elif Global.slot_of_doomshroom == 3:
				Global.seed_3 = ""
				Global.slot_of_doomshroom = 0
				Global.open_slot = 3
			elif Global.slot_of_doomshroom == 4:
				Global.seed_4 = ""
				Global.slot_of_doomshroom = 0
				Global.open_slot = 4
			elif Global.slot_of_doomshroom == 5:
				Global.seed_5 = ""
				Global.slot_of_doomshroom = 0
				Global.open_slot = 5
			elif Global.slot_of_doomshroom == 6:
				Global.seed_6 = ""
				Global.slot_of_doomshroom = 0
				Global.open_slot = 6
			doomshroom_is_pressed = false
			Global.new_open_slot = true
	else:
		if doomshroom_is_pressed == true:
			$".".modulate.a = 1
			Global.doomshroom_selected = false
			Global.amount_of_seeds -= 1
			if Global.slot_of_doomshroom == 1:
				Global.seed_1 = ""
				Global.slot_of_doomshroom = 0
				Global.open_slot = 1
			elif Global.slot_of_doomshroom == 2:
				Global.seed_2 = ""
				Global.slot_of_doomshroom = 0
				Global.open_slot = 2
			elif Global.slot_of_doomshroom == 3:
				Global.seed_3 = ""
				Global.slot_of_doomshroom = 0
				Global.open_slot = 3
			elif Global.slot_of_doomshroom == 4:
				Global.seed_4 = ""
				Global.slot_of_doomshroom = 0
				Global.open_slot = 4
			elif Global.slot_of_doomshroom == 5:
				Global.seed_5 = ""
				Global.slot_of_doomshroom = 0
				Global.open_slot = 5
			elif Global.slot_of_doomshroom == 6:
				Global.seed_6 = ""
				Global.slot_of_doomshroom = 0
				Global.open_slot = 6
			doomshroom_is_pressed = false
			Global.new_open_slot = true
#endregion

func _process(_delta: float) -> void:
	if Global.doomshroom_selected == true:
		doomshroom_is_pressed = true
		$".".modulate.a = 0.5
	else:
		$".".modulate.a = 1
		doomshroom_is_pressed = false
