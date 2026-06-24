tool
extends Button

export (String,MULTILINE) var tooltip = ""

func _ready():
	text = get_parent().name
	hint_tooltip = tooltip
