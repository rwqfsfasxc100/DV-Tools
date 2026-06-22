tool
extends VBoxContainer

export (String) var property_display_name = ""
export (String,MULTILINE) var property_description = ""

export (String) var section_name = ""

export (Array) var default = Array()

export (bool) var require_unique = false

var data : Array = Array()

var mod_box = get_node_or_null(NodePath(".."))



onready var LABEL = $Box/TOOLTIP/Label
onready var BUTTON = $Box/Button
onready var ICON = $Box/TextureRect
onready var ADDDIAG = $Box/AddDiag
onready var LIST = $List

var toggled = false

onready var add_button = Button.new()
onready var hb = HBoxContainer.new()

func _ready():
	if not default:
		default = []
	if Engine.editor_hint:
		pass
	else:
		hb.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		var LB = HBoxContainer.new()
		var RB = HBoxContainer.new()
		LB.rect_min_size = Vector2(5,0)
		RB.rect_min_size = Vector2(5,0)
		hb.add_child(LB)
		
		add_button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		add_button.text = "Add item"
		add_button.align = Button.ALIGN_CENTER
		add_button.connect("pressed",self,"_show_add_item")
		hb.add_child(add_button)
		hb.add_child(RB)
		LIST.add_child(hb)
		
		LABEL.text = property_display_name
		LABEL.get_parent().hint_tooltip = property_display_name + "\n\n" + property_description
		connect("visibility_changed",self,"_on_visibility_changed")
		BUTTON.connect("pressed",self,"_on_button_pressed")
		$ConfirmationDialog.connect("confirmed",self,"_doDelete")
	
	
	
	
	

func _show_add_item():
	pass

func _on_button_pressed():
	toggled = !toggled
	update()

func _draw():
	if LIST:
		LIST.visible = toggled
		ICON.rect_rotation = 180 if toggled else 0
		BUTTON.text = "Config sections: %d" % data.size()

func _on_visibility_changed():
	if Engine.editor_hint:
		return
	if not mod_box:
		mod_box = get_node_or_null(NodePath(".."))
	update()
	yield(get_tree(),"idle_frame")
	LABEL.rect_size = LABEL.get_parent().rect_size
	LABEL.rect_position = Vector2(0,0)

func delete(how:int):
	var c = $ConfirmationDialog
	c.window_title = str(how)
	c.popup_centered()
func _doDelete():
	pass

