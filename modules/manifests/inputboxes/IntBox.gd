tool
extends HBoxContainer

export (String) var property_display_name = ""
export (String) var section_name = ""
export (String) var entry_name = ""

export (int) var default = 0

var data : int = 0

var mod_box = get_node_or_null(NodePath(".."))

onready var LABEL = $Label
onready var SPINBOX = $Panel/SpinBox

func _ready():
	if not default:
		default = 0
	LABEL.text = property_display_name
	SPINBOX.connect("value_changed",self,"_on_text_changed")
	connect("visibility_changed",self,"_on_visibility_changed")

func _on_text_changed(how:float):
	if Engine.editor_hint:
		return
	how = int(round(how))
	if not section_name in mod_box.STATE:
		mod_box.STATE[section_name] = {}
	mod_box.STATE[section_name][entry_name] = how

func _on_visibility_changed():
	if Engine.editor_hint:
		return
	if not mod_box:
		mod_box = get_node_or_null(NodePath(".."))
	data = mod_box.STATE.get(section_name,{}).get(entry_name,default)
	SPINBOX.value = data
