extends Button

var display_system_name = "SYSTEM_EXAMPLE"

var state = {}

signal item_pressed(system)

func _ready():
	name = display_system_name
	text = display_system_name
	connect("pressed",self,"update_display_content")

func update_display_content():
	emit_signal("item_pressed",state)
