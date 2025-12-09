extends HBoxContainer

signal reset(to)

export (String,"string","bool","int","float","color") var type = "string"
export (String) var string_default = ""
export (bool) var bool_default = false
export (int) var int_default = 0
export (float) var float_default = 0.0
export (Color) var color_default = Color(0,0,0,1)


