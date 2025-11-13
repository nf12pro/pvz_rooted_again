extends Button

var tall_nut_is_pressed: bool = false

func _ready() -> void:
	if Global.tall_nut_unlocked == false:
		queue_free()
#region tall_nut Picking
func _on_tall_nut_picker_pressed() -> void:
	if Global.tall_nut_unlocked == false:
		print("You Need To Unlock Twin Sunflower")
	else:
		if Global.amount_of_upgrade_seeds < Global.max_amount_upgrade_seeds:
			if tall_nut_is_pressed == false:
				$".".modulate.a = 0.5
				if Global.upgrade_new_open_slot == false:
					Global.tall_nut_selected = true
					Global.amount_of_upgrade_seeds += 1
					if Global.amount_of_upgrade_seeds == 1:
							Global.upgrade_seed_1 = "Tall Nut"
							Global.slot_of_tall_nut = 1
					elif Global.amount_of_upgrade_seeds == 2:
						Global.upgrade_seed_2 = "Tall Nut"
						Global.slot_of_tall_nut = 2
					elif Global.amount_of_upgrade_seeds == 3:
						Global.upgrade_seed_3 = "Tall Nut"
						Global.slot_of_tall_nut = 3
				elif Global.is_new_upgrade_open_slot == true:
					Global.tall_nut_selected = true
					Global.amount_of_upgrade_seeds += 1
					if Global.upgrade_new_open_slot:
						Global.upgrade_seed_1 = "Tall Nut"
						Global.slot_of_tall_nut = 1
						Global.upgrade_new_open_slot = false
					elif Global.upgrade_new_open_slot_2:
						Global.upgrade_seed_2 = "Tall Nut"
						Global.slot_of_tall_nut = 2
						Global.upgrade_new_open_slot_2 = false
					elif Global.upgrade_new_open_slot_3:
						Global.upgrade_seed_3 = "Tall Nut"
						Global.slot_of_tall_nut = 3
						Global.upgrade_new_open_slot_3 = false
				tall_nut_is_pressed = true
			
			elif tall_nut_is_pressed == true:
				$".".modulate.a = 1
				Global.tall_nut_selected = false
				Global.amount_of_upgrade_seeds -= 1
				print("test")
				if Global.slot_of_tall_nut == 1:
					Global.upgrade_seed_1 = ""
					Global.slot_of_tall_nut = 0
					Global.upgrade_new_open_slot = true
				elif Global.slot_of_tall_nut == 2:
					Global.upgrade_seed_2 = ""
					Global.slot_of_tall_nut = 0
					Global.upgrade_new_open_slot_2 = true
				elif Global.slot_of_tall_nut == 3:
					Global.upgrade_seed_3 = ""
					Global.slot_of_tall_nut = 0
					Global.upgrade_new_open_slot_3 = true
				tall_nut_is_pressed = false
				Global.upgrade_new_open_slot = true
		else:
			if tall_nut_is_pressed == true:
				$".".modulate.a = 1
				Global.tall_nut_selected = false
				Global.amount_of_upgrade_seeds -= 1
				print("test")
				if Global.slot_of_tall_nut == 1:
					Global.upgrade_seed_1 = ""
					Global.slot_of_tall_nut = 0
					Global.upgrade_new_open_slot = true
				elif Global.slot_of_tall_nut == 2:
					Global.upgrade_seed_2 = ""
					Global.slot_of_tall_nut = 0
					Global.upgrade_new_open_slot_2 = true
				elif Global.slot_of_tall_nut == 3:
					Global.upgrade_seed_3 = ""
					Global.slot_of_tall_nut = 0
					Global.upgrade_new_open_slot_3 = true
				tall_nut_is_pressed = false
#endregion

func _process(_delta: float) -> void:
	if Global.tall_nut_selected == true:
		tall_nut_is_pressed = true
		$".".modulate.a = 0.5
	else:
		$".".modulate.a = 1
		tall_nut_is_pressed = false
