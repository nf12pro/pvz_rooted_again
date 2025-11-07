extends Button

var twin_sunflower_is_pressed: bool = false

func _ready() -> void:
	if Global.twin_sunflower_unlocked == false:
		queue_free()
#region twin_sunflower Picking
func _on_twin_sunflower_picker_pressed() -> void:
	if Global.twin_sunflower_unlocked == false:
		print("You Need To Unlock Twin Sunflower")
	else:
		if Global.amount_of_upgrade_seeds < Global.max_amount_upgrade_seeds:
			if twin_sunflower_is_pressed == false:
				$".".modulate.a = 0.5
				if Global.upgrade_new_open_slot == false:
					Global.twin_sunflower_selected = true
					Global.amount_of_upgrade_seeds += 1
					if Global.amount_of_upgrade_seeds == 1:
							Global.upgrade_seed_1 = "Twin Sunflower"
							Global.slot_of_twin_sunflower = 1
					elif Global.amount_of_upgrade_seeds == 2:
						Global.upgrade_seed_2 = "Twin Sunflower"
						Global.slot_of_twin_sunflower = 2
					elif Global.amount_of_upgrade_seeds == 3:
						Global.upgrade_seed_3 = "Twin Sunflower"
						Global.slot_of_twin_sunflower = 3
				elif Global.upgrade_new_open_slot == true:
					Global.twin_sunflower_selected = true
					Global.amount_of_upgrade_seeds += 1
					if Global.upgrade_open_slot == 1:
						Global.upgrade_seed_1 = "Twin Sunflower"
						Global.slot_of_twin_sunflower = 1
					elif Global.upgrade_open_slot == 2:
						Global.upgrade_seed_2 = "Twin Sunflower"
						Global.slot_of_twin_sunflower = 2
					elif Global.upgrade_open_slot == 3:
						Global.upgrade_seed_3 = "Twin Sunflower"
						Global.slot_of_twin_sunflower = 3
					Global.upgrade_new_open_slot = false
					Global.upgrade_open_slot = 0
				twin_sunflower_is_pressed = true
			
			elif twin_sunflower_is_pressed == true:
				$".".modulate.a = 1
				Global.twin_sunflower_selected = false
				Global.amount_of_upgrade_seeds -= 1
				print("test")
				if Global.slot_of_twin_sunflower == 1:
					Global.upgrade_seed_1 = ""
					Global.slot_of_twin_sunflower = 0
					Global.upgrade_open_slot = 1
				elif Global.slot_of_twin_sunflower == 2:
					Global.upgrade_seed_2 = ""
					Global.slot_of_twin_sunflower = 0
					Global.upgrade_open_slot = 2
				elif Global.slot_of_twin_sunflower == 3:
					Global.upgrade_seed_3 = ""
					Global.slot_of_twin_sunflower = 0
					Global.upgrade_open_slot = 3
				twin_sunflower_is_pressed = false
				Global.upgrade_new_open_slot = true
		else:
			if twin_sunflower_is_pressed == true:
				$".".modulate.a = 1
				Global.twin_sunflower_selected = false
				Global.amount_of_upgrade_seeds -= 1
				print("test")
				if Global.slot_of_twin_sunflower == 1:
					Global.upgrade_seed_1 = ""
					Global.slot_of_twin_sunflower = 0
					Global.upgrade_open_slot = 1
				elif Global.slot_of_twin_sunflower == 2:
					Global.upgrade_seed_2 = ""
					Global.slot_of_twin_sunflower = 0
					Global.upgrade_open_slot = 2
				elif Global.slot_of_twin_sunflower == 3:
					Global.upgrade_seed_3 = ""
					Global.slot_of_twin_sunflower = 0
					Global.upgrade_open_slot = 3
				twin_sunflower_is_pressed = false
				Global.upgrade_new_open_slot = true
#endregion

func _process(_delta: float) -> void:
	if Global.twin_sunflower_selected == true:
		twin_sunflower_is_pressed = true
		$".".modulate.a = 0.5
	else:
		$".".modulate.a = 1
		twin_sunflower_is_pressed = false
