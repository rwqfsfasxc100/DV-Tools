extends HBoxContainer

signal reset(to)

export (String,"string","bool","int","float","color") var type = "string"
export (String) var string_default = ""
export (bool) var bool_default = false
export (int) var int_default = 0
export (float) var float_default = 0.0
export (Color) var color_default = Color(0,0,0,1)

export (bool) var required = false

var default

func _ready():
	match type:
		"string":
			default = string_default
		"bool":
			default = bool_default
		"int":
			default = int_default
		"float":
			default = float_default
		"color":
			default = color_default

func reset():
	emit_signal("reset",default)
