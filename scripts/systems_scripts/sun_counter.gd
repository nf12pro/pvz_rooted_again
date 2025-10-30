extends RichTextLabel

func _ready():
	bbcode_enabled = true 

func _process(_delta):
	text = "[font_size=40][color=yellow][b]Sun: " + str(Global.sun_value) + "[/b][/color][/font_size]"
	if Global.sun_value == 1000:
		Global.sun_collector_achievement = true
