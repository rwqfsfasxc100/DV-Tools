extends Control

export (String, \
"ADD_EQUIPMENT_ITEMS", \
"ADD_EQUIPMENT_SLOTS", \
"EQUIPMENT_TAGS", \
"SLOT_ORDER", \
"SLOT_TAGS", \
"WEAPONSLOT_ADD", \
"WEAPONSLOT_MODIFY_TEMPLATES", \
"WEAPONSLOT_MODIFY", \
"WEAPONSLOT_SHIP_TEMPLATES", \
"WEAPONSLOT_SHIP_MODIFY", \
"AUX_POWER_SLOT", \
"MODIFY_INTERNALS", \
"NODE_DEFINITIONS", \
"SHIP_NODE_REGISTER", \
"SHIP_NODE_MODIFY" \
) var driver_mode = "ADD_EQUIPMENT_ITEMS"
export (String) var property = "system"

export (String,"string","bool","int","float","array","dictionary","color") var property_type = "string"

export (String) var string_default = ""
export (bool) var bool_default = false
export (int) var int_default = 1
export (float) var float_default = 1.0
export (Array) var array_default = []
export (Dictionary) var dictionary_default = {}
export (Color) var color_default = Color(0,0,0,1)

var type = ""

var system = ""

func _ready():
	EquipmentDriver.connect("system_selection",self,"change_system")
	EquipmentDriver.connect("driver_item_updated",self,"driver_item_reset")
	EquipmentDriver.connect("driver_updated",self,"driver_reset")
	EquipmentDriver.connect("property_value_set",self,"set_value")
	match get_class():
		"LineEdit":
			type = "LineEdit"
		"SpinBox":
			type = "SpinBox"

func driver_reset(data):
	
	if data != driver_mode:
		return
	pass
	
func driver_item_reset(mode,dict,sys):
	if mode != driver_mode:
		return
	var val = EquipmentDriver.get_driver_property(driver_mode,system,property)
	if not val:
		val = get(property_type + "_default")
	set_value(driver_mode,system,property,val)
#	breakpoint
func change_system(driver,sys):
	if driver != driver_mode:
		return
	system = sys
	

func set_value(mode, sys, prop, to):
	if mode != driver_mode:
		return
	if prop != property:
		return
	var input_property = "text"
	match type:
		"LineEdit":
			input_property = "text"
		"SpinBox":
			input_property = "value"
	set(input_property,to)
