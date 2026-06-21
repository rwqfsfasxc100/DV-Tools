tool
extends VBoxContainer

export (String) var property_display_name = ""
export (String,MULTILINE) var property_description = ""

export (String) var section_name = ""

export (Array) var default = Array()

export (bool) var require_unique = false

var data : Array = Array()

var mod_box = get_node_or_null(NodePath(".."))

const TAG_TYPES = [
	"bool",
	"int",
	"array"
]

const BUILTIN_TAGS = {
	"TAG_ALLOW_ACHIEVEMENTS":["bool",false,"Whether the mod would permit achievements.\nNot currently functional in-game."],
	"TAG_QOL":["bool",false,"Whether the mod adds QOL features."],
	"TAG_OVERHAUL":["bool",false,"Whether the mod overhauls a part or parts of the game."],
	"TAG_VISUAL":["bool",false,"Whether the mod makes visual adjustments."],
	"TAG_FUN":["bool",false,"Whether the mod is more fun than serious."],
	"TAG_UI":["bool",false,"Whether the mod adds UI elements."],
	"TAG_ADDS_SHIPS":["array",[],"Names of ships that the mod adds.\nCan use translation strings."],
	"TAG_ADDS_EQUIPMENT":["array",[],"Names of equipment that the mod adds.\nCan use translation strings."],
	"TAG_ADDS_GAMEPLAY_MECHANICS":["array",[],"Names of gameplay mechanics that the mod adds.\nCan use translation strings."],
	"TAG_ADDS_EVENTS":["array",[],"Names of events that the mod adds.\nCan use translation strings."],
	"TAG_HANDLE_EXTRA_CREW":["int",24,"For ships with very large numbers of crew, prevents derelict dialogue\nbeing broken if the crew count exceeds what the dialogue can handle.\n\nHevLib automatically sets this to 24, so only does anything above that."],
#	"TAG_USING_HEVLIB_RESEARCH":["array",[],""],
}

onready var LABEL = $Box/TOOLTIP/Label
onready var BUTTON = $Box/Button
onready var ICON = $Box/TextureRect
onready var ADDDIAG = $Box/AddDiag
onready var ADDEDIT = $Box/AddDiag/VBoxContainer/LineEdit
onready var ADDOPTS = $Box/AddDiag/VBoxContainer/OptionButton
onready var ADDTAGTYPE = $Box/AddDiag/VBoxContainer/TagType
onready var LIST = $List

var toggled = false

export (PackedScene) var tag_item = preload("res://modules/manifests/inputboxes/parts/TagItem.tscn")

onready var add_button = Button.new()

func _ready():
	if not default:
		default = []
	if Engine.editor_hint:
		pass
	else:
		for i in TAG_TYPES:
			ADDTAGTYPE.add_item(i)
	add_button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	add_button.text = "Add item"
	add_button.align = Button.ALIGN_CENTER
	add_button.connect("pressed",self,"_show_add_item")
	LIST.add_child(add_button)
	ADDDIAG.connect("confirmed",self,"_add_confirmed")
	ADDOPTS.connect("item_selected",self,"_on_preset_selected")
	LABEL.text = property_display_name
	LABEL.get_parent().hint_tooltip = property_display_name + "\n\n" + property_description
	connect("visibility_changed",self,"_on_visibility_changed")
	BUTTON.connect("pressed",self,"_on_button_pressed")

var opts_available_presets = BUILTIN_TAGS.keys()

func _show_add_item():
	ADDEDIT.text = ""
	ADDOPTS.clear()
	get_available_options()
	ADDOPTS.add_item("",0)
	for i in opts_available_presets:
		ADDOPTS.add_item(i)
	ADDDIAG.popup_centered()
	ADDEDIT.grab_focus()

func _on_preset_selected(idx:int):
	if idx > 0:
		var optname = opts_available_presets[idx - 1]
		var opttype = BUILTIN_TAGS[optname][0]
		var optdesc = BUILTIN_TAGS[optname][2]
		var optindex = TAG_TYPES.find(opttype)
		ADDEDIT.text = optname
		ADDTAGTYPE.select(optindex)
		ADDOPTS.hint_tooltip = optname + "\n\n" + optdesc

func get_available_options():
	var available_presets = BUILTIN_TAGS.keys()
	for i in LIST.get_children():
		if "item_name" in i and i.item_name in BUILTIN_TAGS:
			available_presets.erase(i.item_name)
	opts_available_presets = available_presets

func _on_button_pressed():
	toggled = !toggled
	update()

func _on_text_changed(how:Array):
	if Engine.editor_hint:
		return
	if not section_name in mod_box.STATE:
		mod_box.STATE[section_name] = {}

func _on_visibility_changed():
	if Engine.editor_hint:
		return
	if not mod_box:
		mod_box = get_node_or_null(NodePath(".."))
	update()
	yield(get_tree(),"idle_frame")
	LABEL.rect_size = LABEL.get_parent().rect_size
	LABEL.rect_position = Vector2(0,0)


func _draw():
	if LIST:
		LIST.visible = toggled
		ICON.rect_rotation = 180 if toggled else 0
		BUTTON.text = "Tag entries: %d" % data.size()

func _add_confirmed():
	var txt = ADDEDIT.text
	if txt and ((not txt in data) if require_unique else true):
		ADDDIAG.hide()
		add(txt,{})


var labelRefs : Array = []

func resort():
	for i in LIST.get_children():
		if not i == add_button:
			LIST.remove_child(i)
	for i in labelRefs:
		if is_instance_valid(i) and not i.is_queued_for_deletion():
			LIST.add_child(i)
	LIST.move_child(add_button,LIST.get_child_count())


func add(this_item_name:String,how:Dictionary):
	data.append(how)
	var l = tag_item.instance()
	l.item_name = this_item_name
	labelRefs.append(l)
	resort()

func delete(how:int):
	data.remove(how)
	var item = labelRefs[how]
	item.queue_free()
	labelRefs.remove(how)
	resort()


func export_as():
	breakpoint
