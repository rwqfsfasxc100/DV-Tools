extends Button

var display_system_name = "SYSTEM_EXAMPLE"
var data = {}
var mode = "ADD_EQUIPMENT_ITEMS"

signal update_display(data_dictionary,mode,system)

func _ready():
	name = display_system_name
	text = display_system_name
	connect("pressed",self,"update_display_content")

func update_display_content():
	EquipmentDriver.change_system(mode,display_system_name)
	emit_signal("update_display",data,mode,display_system_name)
