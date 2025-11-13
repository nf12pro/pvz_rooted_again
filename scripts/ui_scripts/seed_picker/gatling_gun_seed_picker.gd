extends Button

var gatling_gun_is_pressed: bool = false

func _ready() -> void:
	if Global.gatling_gun_unlocked == false:
		queue_free()
#region gatling_gun Picking
func _on_gatling_gun_picker_pressed() -> void:
	if Global.gatling_gun_unlocked == false:
		print("You Need To Unlock Twin Sunflower")
	else:
		if Global.amount_of_upgrade_seeds < Global.max_amount_upgrade_seeds:
			if gatling_gun_is_pressed == false:
				$".".modulate.a = 0.5
				if Global.upgrade_new_open_slot == false:
					Global.gatling_gun_selected = true
					Global.amount_of_upgrade_seeds += 1
					if Global.amount_of_upgrade_seeds == 1:
							Global.upgrade_seed_1 = "Gatling Gun"
							Global.slot_of_gatling_gun = 1
					elif Global.amount_of_upgrade_seeds == 2:
						Global.upgrade_seed_2 = "Gatling Gun"
						Global.slot_of_gatling_gun = 2
					elif Global.amount_of_upgrade_seeds == 3:
						Global.upgrade_seed_3 = "Gatling Gun"
						Global.slot_of_gatling_gun = 3
				elif Global.is_new_upgrade_open_slot == true:
					Global.gatling_gun_selected = true
					Global.amount_of_upgrade_seeds += 1
					if Global.upgrade_new_open_slot:
						Global.upgrade_seed_1 = "Gatling Gun"
						Global.slot_of_gatling_gun = 1
						Global.upgrade_new_open_slot = false
					elif Global.upgrade_new_open_slot_2:
						Global.upgrade_seed_2 = "Gatling Gun"
						Global.slot_of_gatling_gun = 2
						Global.upgrade_new_open_slot_2 = false
					elif Global.upgrade_new_open_slot_3:
						Global.upgrade_seed_3 = "Gatling Gun"
						Global.slot_of_gatling_gun = 3
						Global.upgrade_new_open_slot_3 = false
				gatling_gun_is_pressed = true
			
			elif gatling_gun_is_pressed == true:
				$".".modulate.a = 1
				Global.gatling_gun_selected = false
				Global.amount_of_upgrade_seeds -= 1
				print("test")
				if Global.slot_of_gatling_gun == 1:
					Global.upgrade_seed_1 = ""
					Global.slot_of_gatling_gun = 0
					Global.upgrade_new_open_slot = true
				elif Global.slot_of_gatling_gun == 2:
					Global.upgrade_seed_2 = ""
					Global.slot_of_gatling_gun = 0
					Global.upgrade_new_open_slot_2 = true
				elif Global.slot_of_gatling_gun == 3:
					Global.upgrade_seed_3 = ""
					Global.slot_of_gatling_gun = 0
					Global.upgrade_new_open_slot_3 = true
				gatling_gun_is_pressed = false
				Global.upgrade_new_open_slot = true
		else:
			if gatling_gun_is_pressed == true:
				$".".modulate.a = 1
				Global.gatling_gun_selected = false
				Global.amount_of_upgrade_seeds -= 1
				print("test")
				if Global.slot_of_gatling_gun == 1:
					Global.upgrade_seed_1 = ""
					Global.slot_of_gatling_gun = 0
					Global.upgrade_new_open_slot = true
				elif Global.slot_of_gatling_gun == 2:
					Global.upgrade_seed_2 = ""
					Global.slot_of_gatling_gun = 0
					Global.upgrade_new_open_slot_2 = true
				elif Global.slot_of_gatling_gun == 3:
					Global.upgrade_seed_3 = ""
					Global.slot_of_gatling_gun = 0
					Global.upgrade_new_open_slot_3 = true
				gatling_gun_is_pressed = false
#endregion

func _process(_delta: float) -> void:
	if Global.gatling_gun_selected == true:
		gatling_gun_is_pressed = true
		$".".modulate.a = 0.5
	else:
		$".".modulate.a = 1
		gatling_gun_is_pressed = false
