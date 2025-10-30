extends Button

var iceberg_lettuce_is_pressed: bool = false

#region iceberg_lettuce Picking
func _on_iceberg_lettuce_picker_pressed() -> void:
	if Global.amount_of_seeds < 6:
		if iceberg_lettuce_is_pressed == false:
			$".".modulate.a = 0.5
			if Global.new_open_slot == false:
				Global.iceberg_lettuce_selected = true
				Global.amount_of_seeds += 1
				if Global.amount_of_seeds == 1:
						Global.seed_1 = "Iceberg Lettuce"
						Global.slot_of_iceberg_lettuce = 1
				elif Global.amount_of_seeds == 2:
					Global.seed_2 = "Iceberg Lettuce"
					Global.slot_of_iceberg_lettuce = 2
				elif Global.amount_of_seeds == 3:
					Global.seed_3 = "Iceberg Lettuce"
					Global.slot_of_iceberg_lettuce = 3
				elif Global.amount_of_seeds == 4:
					Global.seed_4 = "Iceberg Lettuce"
					Global.slot_of_iceberg_lettuce = 4
				elif Global.amount_of_seeds == 5:
					Global.seed_5 = "Iceberg Lettuce"
					Global.slot_of_iceberg_lettuce = 5
				elif Global.amount_of_seeds == 6:
					Global.seed_6 = "Iceberg Lettuce"
					Global.slot_of_iceberg_lettuce = 6
			elif Global.new_open_slot == true:
				Global.iceberg_lettuce_selected = true
				Global.amount_of_seeds += 1
				if Global.open_slot == 1:
					Global.seed_1 = "Iceberg Lettuce"
					Global.slot_of_iceberg_lettuce = 1
				elif Global.open_slot == 2:
					Global.seed_2 = "Iceberg Lettuce"
					Global.slot_of_iceberg_lettuce = 2
				elif Global.open_slot == 3:
					Global.seed_3 = "Iceberg Lettuce"
					Global.slot_of_iceberg_lettuce = 3
				elif Global.open_slot == 4:
					Global.seed_4 = "Iceberg Lettuce"
					Global.slot_of_iceberg_lettuce = 4
				elif Global.open_slot == 5:
					Global.seed_5 = "Iceberg Lettuce"
					Global.slot_of_iceberg_lettuce = 5
				elif Global.open_slot == 6:
					Global.seed_6 = "Iceberg Lettuce"
					Global.slot_of_iceberg_lettuce = 6
				Global.new_open_slot = false
				Global.open_slot = 0
			iceberg_lettuce_is_pressed = true
		elif iceberg_lettuce_is_pressed == true:
			$".".modulate.a = 1
			Global.iceberg_lettuce_selected = false
			Global.amount_of_seeds -= 1
			print("test")
			if Global.slot_of_iceberg_lettuce == 1:
				Global.seed_1 = ""
				Global.slot_of_iceberg_lettuce = 0
				Global.open_slot = 1
			elif Global.slot_of_iceberg_lettuce == 2:
				Global.seed_2 = ""
				Global.slot_of_iceberg_lettuce = 0
				Global.open_slot = 2
			elif Global.slot_of_iceberg_lettuce == 3:
				Global.seed_3 = ""
				Global.slot_of_iceberg_lettuce = 0
				Global.open_slot = 3
			elif Global.slot_of_iceberg_lettuce == 4:
				Global.seed_4 = ""
				Global.slot_of_iceberg_lettuce = 0
				Global.open_slot = 4
			elif Global.slot_of_iceberg_lettuce == 5:
				Global.seed_5 = ""
				Global.slot_of_iceberg_lettuce = 0
				Global.open_slot = 5
			elif Global.slot_of_iceberg_lettuce == 6:
				Global.seed_6 = ""
				Global.slot_of_iceberg_lettuce = 0
				Global.open_slot = 6
			iceberg_lettuce_is_pressed = false
			Global.new_open_slot = true
	else:
		if iceberg_lettuce_is_pressed == true:
			$".".modulate.a = 1
			Global.iceberg_lettuce_selected = false
			Global.amount_of_seeds -= 1
			print("test")
			if Global.slot_of_iceberg_lettuce == 1:
				Global.seed_1 = ""
				Global.slot_of_iceberg_lettuce = 0
				Global.open_slot = 1
			elif Global.slot_of_iceberg_lettuce == 2:
				Global.seed_2 = ""
				Global.slot_of_iceberg_lettuce = 0
				Global.open_slot = 2
			elif Global.slot_of_iceberg_lettuce == 3:
				Global.seed_3 = ""
				Global.slot_of_iceberg_lettuce = 0
				Global.open_slot = 3
			elif Global.slot_of_iceberg_lettuce == 4:
				Global.seed_4 = ""
				Global.slot_of_iceberg_lettuce = 0
				Global.open_slot = 4
			elif Global.slot_of_iceberg_lettuce == 5:
				Global.seed_5 = ""
				Global.slot_of_iceberg_lettuce = 0
				Global.open_slot = 5
			elif Global.slot_of_iceberg_lettuce == 6:
				Global.seed_6 = ""
				Global.slot_of_iceberg_lettuce = 0
				Global.open_slot = 6
			iceberg_lettuce_is_pressed = false
			Global.new_open_slot = true
#endregion

func _process(_delta: float) -> void:
	if Global.iceberg_lettuce_selected == true:
		iceberg_lettuce_is_pressed = true
		$".".modulate.a = 0.5
	else:
		$".".modulate.a = 1
		iceberg_lettuce_is_pressed = false
