extends Button

var frost_pea_is_pressed: bool = false

func _ready() -> void:
	if Global.frost_pea_unlocked == false:
		queue_free()
#region frost_pea Picking
func _on_frost_pea_picker_pressed() -> void:
	if Global.frost_pea_unlocked == false:
		print("You Need To Unlock Frost Pea")
	else:
		if Global.amount_of_upgrade_seeds < Global.max_amount_upgrade_seeds:
			if frost_pea_is_pressed == false:
				$".".modulate.a = 0.5
				if Global.upgrade_new_open_slot == false:
					Global.frost_pea_selected = true
					Global.amount_of_upgrade_seeds += 1
					if Global.amount_of_upgrade_seeds == 1:
							Global.upgrade_seed_1 = "Frost Pea"
							Global.slot_of_frost_pea = 1
					elif Global.amount_of_upgrade_seeds == 2:
						Global.upgrade_seed_2 = "Frost Pea"
						Global.slot_of_frost_pea = 2
					elif Global.amount_of_upgrade_seeds == 3:
						Global.upgrade_seed_3 = "Frost Pea"
						Global.slot_of_frost_pea = 3
				elif Global.upgrade_new_open_slot == true:
					Global.frost_pea_selected = true
					Global.amount_of_upgrade_seeds += 1
					if Global.upgrade_open_slot == 1:
						Global.upgrade_seed_1 = "Frost Pea"
						Global.slot_of_frost_pea = 1
					elif Global.upgrade_open_slot == 2:
						Global.upgrade_seed_2 = "Frost Pea"
						Global.slot_of_frost_pea = 2
					elif Global.upgrade_open_slot == 3:
						Global.upgrade_seed_3 = "Frost Pea"
						Global.slot_of_frost_pea = 3
					Global.upgrade_new_open_slot = false
					Global.upgrade_open_slot = 0
				frost_pea_is_pressed = true
			
			elif frost_pea_is_pressed == true:
				$".".modulate.a = 1
				Global.frost_pea_selected = false
				Global.amount_of_upgrade_seeds -= 1
				print("test")
				if Global.slot_of_frost_pea == 1:
					Global.upgrade_seed_1 = ""
					Global.slot_of_frost_pea = 0
					Global.upgrade_open_slot = 1
				elif Global.slot_of_frost_pea == 2:
					Global.upgrade_seed_2 = ""
					Global.slot_of_frost_pea = 0
					Global.upgrade_open_slot = 2
				elif Global.slot_of_frost_pea == 3:
					Global.upgrade_seed_3 = ""
					Global.slot_of_frost_pea = 0
					Global.upgrade_open_slot = 3
				frost_pea_is_pressed = false
				Global.upgrade_new_open_slot = true
		else:
			if frost_pea_is_pressed == true:
				$".".modulate.a = 1
				Global.frost_pea_selected = false
				Global.amount_of_upgrade_seeds -= 1
				print("test")
				if Global.slot_of_frost_pea == 1:
					Global.upgrade_seed_1 = ""
					Global.slot_of_frost_pea = 0
					Global.upgrade_open_slot = 1
				elif Global.slot_of_frost_pea == 2:
					Global.upgrade_seed_2 = ""
					Global.slot_of_frost_pea = 0
					Global.upgrade_open_slot = 2
				elif Global.slot_of_frost_pea == 3:
					Global.upgrade_seed_3 = ""
					Global.slot_of_frost_pea = 0
					Global.upgrade_open_slot = 3
				frost_pea_is_pressed = false
				Global.upgrade_new_open_slot = true
#endregion

func _process(_delta: float) -> void:
	if Global.frost_pea_selected == true:
		frost_pea_is_pressed = true
		$".".modulate.a = 0.5
	else:
		$".".modulate.a = 1
		frost_pea_is_pressed = false
