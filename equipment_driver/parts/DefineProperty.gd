class_name property_definition
extends Control

export (NodePath) var input_node_p
onready var input_node = get_node_or_null(input_node_p)
export (NodePath) var slider_node_p
onready var slider_node = get_node_or_null(slider_node_p)
export (NodePath) var option_node_p
onready var option_node = get_node_or_null(option_node_p)
export (NodePath) var reset_node_p
onready var reset_node = get_node_or_null(reset_node_p)

export (String) var setting = ""

export (float) var float_step = 0.1

signal value_updated(opt,how)

var tab

onready var input_class = ""

func _ready():
	tab = get_tab()
	if not tab:
		return
	if not input_node:
		return
	if not reset_node:
		return
	tab.connect("file_load_changed",self,"set_enabled")
	tab.connect("update_value_to",self,"update_display")
	reset_node.connect("reset",self,"set_value")
	input_class = input_node.get_class()
	connect("value_updated",tab,"value_updated")
	match input_class:
		"LineEdit":
			input_node.connect("text_changed",self,"set_value")
		"SpinBox":
			if reset_node.type == "float":
				input_node.step = float_step
			input_node.connect("value_changed",self,"set_value")
		"CheckButton":
			input_node.connect("toggled",self,"set_value")
		"ColorPickerButton":
			input_node.connect("color_changed",self,"set_value")
		_:
			breakpoint
	
	if slider_node:
		pass


func set_enabled(to):
	match input_class:
		"LineEdit":
			input_node.editable = to
		"SpinBox":
			input_node.editable = to
		"CheckButton":
			input_node.disabled = !to
		"ColorPickerButton":
			input_node.disabled = !to
	if slider_node:
		slider_node.editable = to
	if option_node:
		option_node.disabled = !to



func get_tab(p:Node = self):
	p = p.get_parent()
	if "needs_save" in p:
		return p
	else:
		return get_tab(p)



func set_value(val):
	emit_signal("value_updated",setting,val)

func update_display(dict):
	var value
	if setting in dict:
		value = dict[setting]
	else:
		value = reset_node.default
	match input_class:
		"LineEdit":
			input_node.text = value
		"SpinBox":
			input_node.value = value
		"CheckButton":
			input_node.pressed = value
		"ColorPickerButton":
			input_node.color = value
	if slider_node:
		slider_node.value = value
	if option_node:
		pass
	
		
