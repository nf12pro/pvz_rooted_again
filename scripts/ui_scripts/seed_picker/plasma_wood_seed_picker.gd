extends Button

var plasma_wood_is_pressed: bool = false

func _ready() -> void:
	if Global.plasma_wood_unlocked == false:
		queue_free()
#region plasma_wood Picking
func _on_plasma_wood_picker_pressed() -> void:
	if Global.plasma_wood_unlocked == false:
		print("You Need To Unlock Twin Sunflower")
	else:
		if Global.amount_of_upgrade_seeds < Global.max_amount_upgrade_seeds:
			if plasma_wood_is_pressed == false:
				$".".modulate.a = 0.5
				if Global.upgrade_new_open_slot == false:
					Global.plasma_wood_selected = true
					Global.amount_of_upgrade_seeds += 1
					if Global.amount_of_upgrade_seeds == 1:
							Global.upgrade_seed_1 = "Plasma Wood"
							Global.slot_of_plasma_wood = 1
					elif Global.amount_of_upgrade_seeds == 2:
						Global.upgrade_seed_2 = "Plasma Wood"
						Global.slot_of_plasma_wood = 2
					elif Global.amount_of_upgrade_seeds == 3:
						Global.upgrade_seed_3 = "Plasma Wood"
						Global.slot_of_plasma_wood = 3
				elif Global.is_new_upgrade_open_slot == true:
					Global.plasma_wood_selected = true
					Global.amount_of_upgrade_seeds += 1
					if Global.upgrade_new_open_slot:
						Global.upgrade_seed_1 = "Plasma Wood"
						Global.slot_of_plasma_wood = 1
						Global.upgrade_new_open_slot = false
					elif Global.upgrade_new_open_slot_2:
						Global.upgrade_seed_2 = "Plasma Wood"
						Global.slot_of_plasma_wood = 2
						Global.upgrade_new_open_slot_2 = false
					elif Global.upgrade_new_open_slot_3:
						Global.upgrade_seed_3 = "Plasma Wood"
						Global.slot_of_plasma_wood = 3
						Global.upgrade_new_open_slot_3 = false
				plasma_wood_is_pressed = true
			
			elif plasma_wood_is_pressed == true:
				$".".modulate.a = 1
				Global.plasma_wood_selected = false
				Global.amount_of_upgrade_seeds -= 1
				print("test")
				if Global.slot_of_plasma_wood == 1:
					Global.upgrade_seed_1 = ""
					Global.slot_of_plasma_wood = 0
					Global.upgrade_new_open_slot = true
				elif Global.slot_of_plasma_wood == 2:
					Global.upgrade_seed_2 = ""
					Global.slot_of_plasma_wood = 0
					Global.upgrade_new_open_slot_2 = true
				elif Global.slot_of_plasma_wood == 3:
					Global.upgrade_seed_3 = ""
					Global.slot_of_plasma_wood = 0
					Global.upgrade_new_open_slot_3 = true
				plasma_wood_is_pressed = false
				Global.upgrade_new_open_slot = true
		else:
			if plasma_wood_is_pressed == true:
				$".".modulate.a = 1
				Global.plasma_wood_selected = false
				Global.amount_of_upgrade_seeds -= 1
				print("test")
				if Global.slot_of_plasma_wood == 1:
					Global.upgrade_seed_1 = ""
					Global.slot_of_plasma_wood = 0
					Global.upgrade_new_open_slot = true
				elif Global.slot_of_plasma_wood == 2:
					Global.upgrade_seed_2 = ""
					Global.slot_of_plasma_wood = 0
					Global.upgrade_new_open_slot_2 = true
				elif Global.slot_of_plasma_wood == 3:
					Global.upgrade_seed_3 = ""
					Global.slot_of_plasma_wood = 0
					Global.upgrade_new_open_slot_3 = true
				plasma_wood_is_pressed = false
#endregion

func _process(_delta: float) -> void:
	if Global.plasma_wood_selected == true:
		plasma_wood_is_pressed = true
		$".".modulate.a = 0.5
	else:
		$".".modulate.a = 1
		plasma_wood_is_pressed = false
