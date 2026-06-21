extends VBoxContainer

export (String,"ALL","null","bool","int","float","string","Vector2","Rect2","Vector3","Transform2D","Color","Dictionary","Array","PoolByteArray","PoolIntArray","PoolRealArray","PoolStringArray","PoolVector2Array","PoolVector3Array","PoolColorArray") var property_type = "ALL"

const supported_property_types = [
	"null",
	"bool",
	"int",
	"float",
	"string",
	"Vector2",
	"Rect2",
	"Vector3",
	"Transform2D",
	"Color",
	"Dictionary",
	"Array",
	"PoolByteArray",
	"PoolIntArray",
	"PoolRealArray",
	"PoolStringArray",
	"PoolVector2Array",
	"PoolVector3Array",
	"PoolColorArray",
]

const property_nodes = {
	"null":preload("res://property_editor/property_containers/null.tscn"),
	"bool":preload("res://property_editor/property_containers/bool.tscn"),
	"int":preload("res://property_editor/property_containers/int.tscn"),
	"float":preload("res://property_editor/property_containers/float.tscn"),
	"string":preload("res://property_editor/property_containers/string.tscn"),
	"Vector2":preload("res://property_editor/property_containers/vec2.tscn"),
	"Vector3":preload("res://property_editor/property_containers/vec3.tscn"),
	"Rect2":preload("res://property_editor/property_containers/rect2.tscn"),
	"Transform2D":preload("res://property_editor/property_containers/transform2d.tscn"),
	"Color":preload("res://property_editor/property_containers/color.tscn"),
	"Dictionary":preload("res://property_editor/property_containers/dict.tscn"),
}

var selected_property_type = "null"
var property_box = null

func get_property_value():
	if property_box and property_box.has_method("get_property_value"):
		return property_box.get_property_value()

onready var edit_button = $box_alignment/EDIT
onready var type_select_popup = $TypeSelect
onready var type_selector = $TypeSelect/PanelContainer/OptionButton
onready var property_container = $box_alignment/property

func _ready():
	var editable_type = property_type == "ALL"
	edit_button.visible = editable_type
	edit_button.connect("pressed",self,"_open_property_selector")
	type_select_popup.connect("confirmed",self,"_change_property_to")
	
	
	
	
	if property_type in supported_property_types:
		pass
	else:
		pass
	


func _open_property_selector():
	type_selector.clear()
	for i in supported_property_types:
		type_selector.add_item(i)
	
	
	type_select_popup.popup_centered()

func _change_property_to():
	var idx = type_selector.selected
	var property = supported_property_types[idx]
	if property in property_nodes:
		var node = property_nodes[property].instance()
		property_box = node
		selected_property_type = property
		for i in property_container.get_children():
			i.queue_free()
		property_container.add_child(node)
