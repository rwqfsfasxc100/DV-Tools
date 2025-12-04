extends Button

export var description_label = NodePath("../../../../../../../../../../../../../../../PropertyDialogue")
onready var p = get_node_or_null(description_label)

export var description_text = "Example description here!"

export (NodePath) var input
export (NodePath) var selector
export (NodePath) var slider

export (String) var property = "system"

export (String,"string","bool","int","float","array","dictionary","color") var property_type = "string"

export (String) var string_default = ""
export (bool) var bool_default = false
export (int) var int_default = 1
export (float) var float_default = 1.0
export (Array) var array_default = []
export var dictionary_default = ""
export (Color) var color_default = Color(0,0,0,1)


var has_been_set = false
func _ready():
	connect("pressed",self,"open")
	
	
func open():
	if p:
		p.dialog_text = description_text
		p.popup_centered()
