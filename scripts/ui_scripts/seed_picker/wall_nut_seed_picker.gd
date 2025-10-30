extends Button

var wallnut_is_pressed: bool = false

#region wallnut Picking
func _on_wallnut_picker_pressed() -> void:
	if Global.amount_of_seeds < 6:
		if wallnut_is_pressed == false:
			$".".modulate.a = 0.5
			if Global.new_open_slot == false:
				Global.wallnut_selected = true
				Global.amount_of_seeds += 1
				if Global.amount_of_seeds == 1:
						Global.seed_1 = "WallNut"
						Global.slot_of_wallnut = 1
				elif Global.amount_of_seeds == 2:
					Global.seed_2 = "WallNut"
					Global.slot_of_wallnut = 2
				elif Global.amount_of_seeds == 3:
					Global.seed_3 = "WallNut"
					Global.slot_of_wallnut = 3
				elif Global.amount_of_seeds == 4:
					Global.seed_4 = "WallNut"
					Global.slot_of_wallnut = 4
				elif Global.amount_of_seeds == 5:
					Global.seed_5 = "WallNut"
					Global.slot_of_wallnut = 5
				elif Global.amount_of_seeds == 6:
					Global.seed_6 = "WallNut"
					Global.slot_of_wallnut = 6
			elif Global.new_open_slot == true:
				Global.wallnut_selected = true
				Global.amount_of_seeds += 1
				if Global.open_slot == 1:
					Global.seed_1 = "WallNut"
					Global.slot_of_wallnut = 1
				elif Global.open_slot == 2:
					Global.seed_2 = "WallNut"
					Global.slot_of_wallnut = 2
				elif Global.open_slot == 3:
					Global.seed_3 = "WallNut"
					Global.slot_of_wallnut = 3
				elif Global.open_slot == 4:
					Global.seed_4 = "WallNut"
					Global.slot_of_wallnut = 4
				elif Global.open_slot == 5:
					Global.seed_5 = "WallNut"
					Global.slot_of_wallnut = 5
				elif Global.open_slot == 6:
					Global.seed_6 = "WallNut"
					Global.slot_of_wallnut = 6
				Global.new_open_slot = false
				Global.open_slot = 0
			wallnut_is_pressed = true
		
		elif wallnut_is_pressed == true:
			$".".modulate.a = 1
			Global.wallnut_selected = false
			Global.amount_of_seeds -= 1
			print("test")
			if Global.slot_of_wallnut == 1:
				Global.seed_1 = ""
				Global.slot_of_wallnut = 0
				Global.open_slot = 1
			elif Global.slot_of_wallnut == 2:
				Global.seed_2 = ""
				Global.slot_of_wallnut = 0
				Global.open_slot = 2
			elif Global.slot_of_wallnut == 3:
				Global.seed_3 = ""
				Global.slot_of_wallnut = 0
				Global.open_slot = 3
			elif Global.slot_of_wallnut == 4:
				Global.seed_4 = ""
				Global.slot_of_wallnut = 0
				Global.open_slot = 4
			elif Global.slot_of_wallnut == 5:
				Global.seed_5 = ""
				Global.slot_of_wallnut = 0
				Global.open_slot = 5
			elif Global.slot_of_wallnut == 6:
				Global.seed_6 = ""
				Global.slot_of_wallnut = 0
				Global.open_slot = 6
			wallnut_is_pressed = false
			Global.new_open_slot = true
	else:
		if wallnut_is_pressed == true:
			$".".modulate.a = 1
			Global.wallnut_selected = false
			Global.amount_of_seeds -= 1
			print("test")
			if Global.slot_of_wallnut == 1:
				Global.seed_1 = ""
				Global.slot_of_wallnut = 0
				Global.open_slot = 1
			elif Global.slot_of_wallnut == 2:
				Global.seed_2 = ""
				Global.slot_of_wallnut = 0
				Global.open_slot = 2
			elif Global.slot_of_wallnut == 3:
				Global.seed_3 = ""
				Global.slot_of_wallnut = 0
				Global.open_slot = 3
			elif Global.slot_of_wallnut == 4:
				Global.seed_4 = ""
				Global.slot_of_wallnut = 0
				Global.open_slot = 4
			elif Global.slot_of_wallnut == 5:
				Global.seed_5 = ""
				Global.slot_of_wallnut = 0
				Global.open_slot = 5
			elif Global.slot_of_wallnut == 6:
				Global.seed_6 = ""
				Global.slot_of_wallnut = 0
				Global.open_slot = 6
			wallnut_is_pressed = false
			Global.new_open_slot = true
#endregion

func _process(_delta: float) -> void:
	if Global.wallnut_selected == true:
		wallnut_is_pressed = true
		$".".modulate.a = 0.5
	else:
		$".".modulate.a = 1
		wallnut_is_pressed = false
