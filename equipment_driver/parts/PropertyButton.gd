extends Button

export var description_label = NodePath("../../../../../../../../../../../../../../../PropertyDialogue")
onready var p = get_node_or_null(description_label)

export var description_text = "Example description here!"


var has_been_set = false
func _ready():
	connect("pressed",self,"open")
	
	
func open():
	if p:
		p.dialog_text = description_text
		p.popup_centered()
