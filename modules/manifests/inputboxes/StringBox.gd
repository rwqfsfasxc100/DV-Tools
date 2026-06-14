tool
extends HBoxContainer

export (String) var property_display_name = ""
export (String,MULTILINE) var property_description = ""

export (String) var section_name = ""
export (String) var entry_name = ""

export (String) var default = ""

var data : String = ""

var mod_box = get_node_or_null(NodePath(".."))

onready var LABEL = $TOOLTIP/Label
onready var LINEEDIT = $Panel/LineEdit

func _ready():
	if not default:
		default = ""
	LABEL.text = property_display_name
	LINEEDIT.connect("text_changed",self,"_on_text_changed")
	LABEL.get_parent().hint_tooltip = property_display_name + "\n\n" + property_description
	connect("visibility_changed",self,"_on_visibility_changed")

func _on_text_changed(how:String):
	if Engine.editor_hint:
		return
	if not section_name in mod_box.STATE:
		mod_box.STATE[section_name] = {}
	mod_box.STATE[section_name][entry_name] = how

func _on_visibility_changed():
	if Engine.editor_hint:
		return
	if not mod_box:
		mod_box = get_node_or_null(NodePath(".."))
	data = mod_box.STATE.get(section_name,{}).get(entry_name,default)
	LINEEDIT.text = data
	yield(get_tree(),"idle_frame")
	LABEL.rect_size = LABEL.get_parent().rect_size
	LABEL.rect_position = Vector2(0,0)


func export_as():
	breakpoint
