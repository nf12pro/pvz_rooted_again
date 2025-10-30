extends Button

var laser_bean_is_pressed: bool = false


#region laser_bean Picking
func _on_laser_bean_picker_pressed() -> void:
	if Global.amount_of_seeds < 6:
		if laser_bean_is_pressed == false:
			$".".modulate.a = 0.5
			if Global.new_open_slot == false:
				Global.laser_bean_selected = true
				Global.amount_of_seeds += 1
				if Global.amount_of_seeds == 1:
						Global.seed_1 = "Laser Bean"
						Global.slot_of_laser_bean = 1
				elif Global.amount_of_seeds == 2:
					Global.seed_2 = "Laser Bean"
					Global.slot_of_laser_bean = 2
				elif Global.amount_of_seeds == 3:
					Global.seed_3 = "Laser Bean"
					Global.slot_of_laser_bean = 3
				elif Global.amount_of_seeds == 4:
					Global.seed_4 = "Laser Bean"
					Global.slot_of_laser_bean = 4
				elif Global.amount_of_seeds == 5:
					Global.seed_5 = "Laser Bean"
					Global.slot_of_laser_bean = 5
				elif Global.amount_of_seeds == 6:
					Global.seed_6 = "Laser Bean"
					Global.slot_of_laser_bean = 6
			elif Global.new_open_slot == true:
				Global.laser_bean_selected = true
				Global.amount_of_seeds += 1
				if Global.open_slot == 1:
					Global.seed_1 = "Laser Bean"
					Global.slot_of_laser_bean = 1
				elif Global.open_slot == 2:
					Global.seed_2 = "Laser Bean"
					Global.slot_of_laser_bean = 2
				elif Global.open_slot == 3:
					Global.seed_3 = "Laser Bean"
					Global.slot_of_laser_bean = 3
				elif Global.open_slot == 4:
					Global.seed_4 = "Laser Bean"
					Global.slot_of_laser_bean = 4
				elif Global.open_slot == 5:
					Global.seed_5 = "Laser Bean"
					Global.slot_of_laser_bean = 5
				elif Global.open_slot == 6:
					Global.seed_6 = "Laser Bean"
					Global.slot_of_laser_bean = 6
				Global.new_open_slot = false
				Global.open_slot = 0
			laser_bean_is_pressed = true

		elif laser_bean_is_pressed == true:
			$".".modulate.a = 1
			Global.laser_bean_selected = false
			Global.amount_of_seeds -= 1
			print("test")
			if Global.slot_of_laser_bean == 1:
				Global.seed_1 = ""
				Global.slot_of_laser_bean = 0
				Global.open_slot = 1
			elif Global.slot_of_laser_bean == 2:
				Global.seed_2 = ""
				Global.slot_of_laser_bean = 0
				Global.open_slot = 2
			elif Global.slot_of_laser_bean == 3:
				Global.seed_3 = ""
				Global.slot_of_laser_bean = 0
				Global.open_slot = 3
			elif Global.slot_of_laser_bean == 4:
				Global.seed_4 = ""
				Global.slot_of_laser_bean = 0
				Global.open_slot = 4
			elif Global.slot_of_laser_bean == 5:
				Global.seed_5 = ""
				Global.slot_of_laser_bean = 0
				Global.open_slot = 5
			elif Global.slot_of_laser_bean == 6:
				Global.seed_6 = ""
				Global.slot_of_laser_bean = 0
				Global.open_slot = 6
			laser_bean_is_pressed = false
			Global.new_open_slot = true
	else:
		if laser_bean_is_pressed == true:
			$".".modulate.a = 1
			Global.laser_bean_selected = false
			Global.amount_of_seeds -= 1
			print("test")
			if Global.slot_of_laser_bean == 1:
				Global.seed_1 = ""
				Global.slot_of_laser_bean = 0
				Global.open_slot = 1
			elif Global.slot_of_laser_bean == 2:
				Global.seed_2 = ""
				Global.slot_of_laser_bean = 0
				Global.open_slot = 2
			elif Global.slot_of_laser_bean == 3:
				Global.seed_3 = ""
				Global.slot_of_laser_bean = 0
				Global.open_slot = 3
			elif Global.slot_of_laser_bean == 4:
				Global.seed_4 = ""
				Global.slot_of_laser_bean = 0
				Global.open_slot = 4
			elif Global.slot_of_laser_bean == 5:
				Global.seed_5 = ""
				Global.slot_of_laser_bean = 0
				Global.open_slot = 5
			elif Global.slot_of_laser_bean == 6:
				Global.seed_6 = ""
				Global.slot_of_laser_bean = 0
				Global.open_slot = 6
			laser_bean_is_pressed = false
			Global.new_open_slot = true
#endregion

func _process(_delta: float) -> void:
	if Global.laser_bean_selected== true:
		laser_bean_is_pressed = true
		$".".modulate.a = 0.5
	else:
		$".".modulate.a = 1
		laser_bean_is_pressed = false
