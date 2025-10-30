extends Button

#region Variable
var is_pressed: bool = false #peashooter only
var sunflower_is_pressed: bool = false
var wallnut_is_pressed: bool = false

var slot_of_peashooter: int = 0
var slot_of_sunflower: int = 0
var slot_of_wallnut: int = 0
#endregion

#region Peashooter Picking
func peashooter_on_pressed() -> void:
	if is_pressed == false:
		Global.peashooter_selected = true
		Global.amount_of_seeds += 1
		if Global.amount_of_seeds == 1:
			Global.seed_1 = "Peashooter"
			slot_of_peashooter = 1
		elif Global.amount_of_seeds == 2:
			Global.seed_2 = "Peashooter"
			slot_of_peashooter = 2
		elif Global.amount_of_seeds == 3:
			Global.seed_3 = "Peashooter"
			slot_of_peashooter = 3
		elif Global.amount_of_seeds == 4:
			Global.seed_4 = "Peashooter"
			slot_of_peashooter = 4
		elif Global.amount_of_seeds == 5:
			Global.seed_5 = "Peashooter"
			slot_of_peashooter = 5
		elif Global.amount_of_seeds == 6:
			Global.seed_6 = "Peashooter"
			slot_of_peashooter = 6
		else:
			pass
		
		print(Global.seed_1)
		is_pressed = true
	
	elif is_pressed == true:
		Global.peashooter_selected = false
		Global.amount_of_seeds -= 1
		print("test")
		if slot_of_peashooter == 1:
			Global.seed_1 = ""
			slot_of_peashooter = 0
		elif slot_of_peashooter == 2:
			Global.seed_2 = ""
			slot_of_peashooter = 0
		elif slot_of_peashooter== 3:
			Global.seed_3 = ""
			slot_of_peashooter = 0
		elif slot_of_peashooter == 4:
			Global.seed_4 = ""
			slot_of_peashooter = 0
		elif slot_of_peashooter == 5:
			Global.seed_5 = ""
			slot_of_peashooter = 0
		elif slot_of_peashooter == 6:
			Global.seed_6 = ""
			slot_of_peashooter = 0
		is_pressed = false
#endregion

#region Sunflower Picking
func _on_sunflower_picker_pressed() -> void:
	if sunflower_is_pressed == false:
		Global.sunflower_selected = true
		Global.amount_of_seeds += 1
		if Global.amount_of_seeds == 1:
			Global.seed_1 = "Sunflower"
			slot_of_sunflower = 1
		elif Global.amount_of_seeds == 2:
			Global.seed_2 = "Sunflower"
			slot_of_sunflower = 2
		elif Global.amount_of_seeds == 3:
			Global.seed_3 = "Sunflower"
			slot_of_sunflower = 3
		elif Global.amount_of_seeds == 4:
			Global.seed_4 = "Sunflower"
			slot_of_sunflower = 4
		elif Global.amount_of_seeds == 5:
			Global.seed_5 = "Sunflower"
			slot_of_sunflower = 5
		elif Global.amount_of_seeds == 6:
			Global.seed_6 = "Sunflower"
			slot_of_sunflower = 6
		else:
			pass
		print(Global.seed_1)
		sunflower_is_pressed = true
	
	elif sunflower_is_pressed == true:
		Global.sunflower_selected = false
		Global.amount_of_seeds -= 1
		print("test")
		if slot_of_sunflower == 1:
			Global.seed_1 = ""
			slot_of_sunflower = 0
		elif slot_of_sunflower == 2:
			Global.seed_2 = ""
			slot_of_sunflower = 0
		elif slot_of_sunflower == 3:
			Global.seed_3 = ""
			slot_of_sunflower = 0
		elif slot_of_sunflower == 4:
			Global.seed_4 = ""
			slot_of_sunflower = 0
		elif slot_of_sunflower == 5:
			Global.seed_5 = ""
			slot_of_sunflower = 0
		elif slot_of_sunflower == 6:
			Global.seed_6 = ""
			slot_of_sunflower = 0
		sunflower_is_pressed = false
#endregion

#region WallNut Picking
func _on_wall_nut_picker_pressed() -> void:
	if wallnut_is_pressed == false:
		print("CHECK")
		Global.wallnut_selected = true
		Global.amount_of_seeds += 1
		if Global.amount_of_seeds == 1:
			Global.seed_1 = "WallNut"
			slot_of_wallnut = 1
		elif Global.amount_of_seeds == 2:
			Global.seed_2 = "WallNut"
			slot_of_wallnut = 2
		elif Global.amount_of_seeds == 3:
			Global.seed_3 = "WallNut"
			slot_of_wallnut = 3
		elif Global.amount_of_seeds == 4:
			Global.seed_4 = "WallNut"
			slot_of_wallnut = 4
		elif Global.amount_of_seeds == 5:
			Global.seed_5 = "WallNut"
			slot_of_wallnut = 5
		elif Global.amount_of_seeds == 6:
			Global.seed_6 = "WallNut"
			slot_of_wallnut = 6
		else:
			pass
		
		print(Global.seed_1)
		wallnut_is_pressed = true
	
	elif is_pressed == true:
		Global.wallnut_selected = false
		Global.amount_of_seeds -= 1
		print("test")
		if slot_of_wallnut == 1:
			Global.seed_1 = ""
			slot_of_wallnut = 0
		elif slot_of_wallnut == 2:
			Global.seed_2 = ""
			slot_of_wallnut = 0
		elif slot_of_wallnut == 3:
			Global.seed_3 = ""
			slot_of_wallnut = 0
		elif slot_of_wallnut == 4:
			Global.seed_4 = ""
			slot_of_wallnut = 0
		elif slot_of_wallnut == 5:
			Global.seed_5 = ""
			slot_of_wallnut = 0
		elif slot_of_wallnut == 6:
			Global.seed_6 = ""
			slot_of_wallnut = 0
		wallnut_is_pressed = false
