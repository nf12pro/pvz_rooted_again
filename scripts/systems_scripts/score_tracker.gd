extends RichTextLabel

func _ready():
	bbcode_enabled = true 

func _process(_delta):
	text = "[font_size=40][b]Score: " + str(Global.score) + "[/b][/font_size]"
