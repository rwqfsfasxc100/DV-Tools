extends PanelContainer

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

export var fp = NodePath("VBoxContainer/VBoxContainer/HBoxContainer3/FilePath")
onready var file_path = get_node_or_null(fp)

export var em = NodePath("Dialog/ErrorMSG")
onready var error_message = get_node_or_null(em)

export var of = NodePath("VBoxContainer/VBoxContainer/HBoxContainer3/OpenFile")
onready var select_file = get_node_or_null(of)
export var lf = NodePath("VBoxContainer/VBoxContainer/HBoxContainer/LoadFile")
onready var load_file = get_node_or_null(lf)
export var cf = NodePath("VBoxContainer/VBoxContainer/HBoxContainer/CloseFile")
onready var close_file = get_node_or_null(cf)
export var sf = NodePath("VBoxContainer/VBoxContainer/HBoxContainer/SaveFile")
onready var save_file = get_node_or_null(sf)

export var dofc = NodePath("Dialog/OpenFile")
onready var open_file_dialog = get_node_or_null(dofc)

onready var config_section = "panel_" + driver_mode + "_data"

var current_driver_file = ""

func get_driver_data() -> Dictionary:
	var data = {}
	match driver_mode:
		"ADD_EQUIPMENT_ITEMS":
			pass
		"ADD_EQUIPMENT_SLOTS":
			pass
		"EQUIPMENT_TAGS":
			pass
		"SLOT_ORDER":
			pass
		"SLOT_TAGS":
			pass
		"WEAPONSLOT_ADD":
			pass
		"WEAPONSLOT_MODIFY_TEMPLATES":
			pass
		"WEAPONSLOT_MODIFY":
			pass
		"WEAPONSLOT_SHIP_TEMPLATES":
			pass
		"WEAPONSLOT_SHIP_MODIFY":
			pass
		"AUX_POWER_SLOT":
			pass
		"MODIFY_INTERNALS":
			pass
		"NODE_DEFINITIONS":
			pass
		"SHIP_NODE_REGISTER":
			pass
		"SHIP_NODE_MODIFY":
			pass
	
	
	return data





var hints = {
	"ADD_EQUIPMENT_ITEMS":"Equipment Addition File",
	"ADD_EQUIPMENT_SLOTS":"Slot Addition File",
	"EQUIPMENT_TAGS":"Equipment Tagging File",
	"SLOT_ORDER":"Slot Ordering File",
	"SLOT_TAGS":"Slot Tagging File",
	"WEAPONSLOT_ADD":"Weaponslot Additions File",
	"WEAPONSLOT_MODIFY_TEMPLATES":"Weaponslot Template Modifications File",
	"WEAPONSLOT_MODIFY":"Weaponslot Item Modifications File",
	"WEAPONSLOT_SHIP_TEMPLATES":"Weaponslot Ship Template Modifications File",
	"WEAPONSLOT_SHIP_MODIFY":"Weaponslot Ship Item Modifications File",
	"AUX_POWER_SLOT":"Auxiliary Power & Thruster Additions File",
	"MODIFY_INTERNALS":"Ship Internal Modifications File",
	"NODE_DEFINITIONS":"Ship Node Definitions File",
	"SHIP_NODE_REGISTER":"Ship Node Register File",
	"SHIP_NODE_MODIFY":"Ship Node Modifications File",
}































var open_file_folder_path = ""



func show_open_file():
	open_file_folder_path = Settings.get_value(config_section,"open_file_folder_path")
	if open_file_folder_path != "":
		open_file_dialog.set_current_dir(open_file_folder_path)
	open_file_dialog.popup_centered()


func _ready():
	var open_file_filter = driver_mode + ".gd ; " + hints.get(driver_mode)
	
	match driver_mode:
		"AUX_POWER_SLOT":
			pass
	open_file_folder_path = Settings.get_value(config_section,"open_file_folder_path")
	if open_file_folder_path == null:
		Settings.set_value(config_section,"open_file_folder_path","")
		open_file_folder_path = ""
	open_file_dialog.filters = PoolStringArray([open_file_filter])
	


func open_driver_file(path):
	current_driver_file = path
	file_path.text = path
	path = path.split(path.split("/")[path.split("/").size() - 1])[0]
	Settings.set_value(config_section,"open_file_folder_path",path)
	
	
var driver_data = {}

func _on_FilePath_text_changed(new_text):
	current_driver_file = new_text

var file = File.new()
func load_driver_file():
	var r = EquipmentDriver.load_driver(current_driver_file,driver_mode)
	if r != OK:
		handle_errors(r)
	else:
		driver_data = EquipmentDriver.get_driver(driver_mode)
		clear_driver()
		process_driver()

func process_driver():
	
	
	pass

func handle_errors(err):
	match err:
		ERR_DOES_NOT_EXIST:
			error_message.dialog_text = "Error: driver method does not exist"
		ERR_FILE_CANT_OPEN:
			error_message.dialog_text = "Error: file does not exist"
		ERR_FILE_NO_PERMISSION:
			error_message.dialog_text = "Error: unsaved changes. Save and close the current driver before continuing."
	error_message.popup_centered()

func clear_driver():
	if driver_data.get("should_save"):
		handle_errors(ERR_FILE_NO_PERMISSION)
	else:
		pass
