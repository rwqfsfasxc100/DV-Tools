extends Tabs

const equipment_button = preload("res://driver_panel/EquipmentButton.tscn")

export (NodePath) var system_p
onready var system = get_node_or_null(system_p)
export (NodePath) var equipment_type_p
onready var equipment_type = get_node_or_null(equipment_type_p)
export (NodePath) var slot_type_p
onready var slot_type = get_node_or_null(slot_type_p)
export (NodePath) var num_val_p
onready var num_val = get_node_or_null(num_val_p)
export (NodePath) var capability_lock_p
onready var capability_lock = get_node_or_null(capability_lock_p)
export (NodePath) var name_override_p
onready var name_override = get_node_or_null(name_override_p)
export (NodePath) var description_p
onready var description = get_node_or_null(description_p)
export (NodePath) var manual_p
onready var manual = get_node_or_null(manual_p)
export (NodePath) var specs_p
onready var specs = get_node_or_null(specs_p)
export (NodePath) var price_p
onready var price = get_node_or_null(price_p)
export (NodePath) var test_protocol_p
onready var test_protocol = get_node_or_null(test_protocol_p)
export (NodePath) var default_p
onready var default = get_node_or_null(default_p)
export (NodePath) var control_p
onready var control = get_node_or_null(control_p)
export (NodePath) var story_flag_p
onready var story_flag = get_node_or_null(story_flag_p)
export (NodePath) var story_flag_min_p
onready var story_flag_min = get_node_or_null(story_flag_min_p)
export (NodePath) var story_flag_max_p
onready var story_flag_max = get_node_or_null(story_flag_max_p)
export (NodePath) var warn_if_thermal_below_p
onready var warn_if_thermal_below = get_node_or_null(warn_if_thermal_below_p)
export (NodePath) var warn_if_electric_below_p
onready var warn_if_electric_below = get_node_or_null(warn_if_electric_below_p)
export (NodePath) var sticker_price_format_p
onready var sticker_price_format = get_node_or_null(sticker_price_format_p)
export (NodePath) var sticker_price_multi_format_p
onready var sticker_price_multi_format = get_node_or_null(sticker_price_multi_format_p)
export (NodePath) var installed_color_p
onready var installed_color = get_node_or_null(installed_color_p)
export (NodePath) var disabled_color_p
onready var disabled_color = get_node_or_null(disabled_color_p)
export (NodePath) var alignment_p
onready var alignment = get_node_or_null(alignment_p)
export (NodePath) var restriction_p
onready var restriction = get_node_or_null(restriction_p)
export (NodePath) var config_id_p
onready var config_id = get_node_or_null(config_id_p)
export (NodePath) var config_section_p
onready var config_section = get_node_or_null(config_section_p)
export (NodePath) var config_entry_p
onready var config_entry = get_node_or_null(config_entry_p)

export (NodePath) var filepath_p
onready var filepath = get_node_or_null(filepath_p)
export (NodePath) var driverlist_p
onready var driverlist = get_node_or_null(driverlist_p)

export (NodePath) var button_openfile_p
onready var button_openfile = get_node_or_null(button_openfile_p)
export (NodePath) var button_loadfile_p
onready var button_loadfile = get_node_or_null(button_loadfile_p)
export (NodePath) var button_closefile_p
onready var button_closefile = get_node_or_null(button_closefile_p)
export (NodePath) var button_savefile_p
onready var button_savefile = get_node_or_null(button_savefile_p)
export (NodePath) var button_newentry_p
onready var button_newentry = get_node_or_null(button_newentry_p)
export (NodePath) var button_deleteentry_p
onready var button_deleteentry = get_node_or_null(button_deleteentry_p)

export (NodePath) var dialog_deletesure_p
onready var dialog_deletesure = get_node_or_null(dialog_deletesure_p)
export (NodePath) var dialog_newentry_p
onready var dialog_newentry = get_node_or_null(dialog_newentry_p)
export (NodePath) var dialog_openfile_p
onready var dialog_openfile = get_node_or_null(dialog_openfile_p)
export (NodePath) var dialog_errormsg_p
onready var dialog_errormsg = get_node_or_null(dialog_errormsg_p)
export (NodePath) var dialog_unsaveddata_p
onready var dialog_unsaveddata = get_node_or_null(dialog_unsaveddata_p)

export var driver_file_path_section = "add_equipment_items"
export var driver_file_path_setting = "selected_driver"
export var driver_folder_path_setting = "selected_driver_folder"

onready var driver_file_path = Settings.get_value(driver_file_path_section,driver_file_path_setting)
onready var driver_folder_path = Settings.get_value(driver_file_path_section,driver_folder_path_setting)

var file = File.new()

var state = {}

var needs_save = false

func _ready():
	button_openfile.connect("pressed",self,"openfile_pressed")
	button_loadfile.connect("pressed",self,"loadfile_pressed")
	button_closefile.connect("pressed",self,"closefile_pressed")
	button_savefile.connect("pressed",self,"savefile_pressed")
	button_newentry.connect("pressed",self,"newentry_pressed")
	button_deleteentry.connect("pressed",self,"deleteentry_pressed")
	dialog_deletesure.connect("confirmed",self,"deletesure_confirmed")
	dialog_newentry.connect("confirmed",self,"newentry_confirmed")
	dialog_openfile.connect("file_selected",self,"openfile_file_selected")
	dialog_unsaveddata.connect("confirmed",self,"unsaveddata_confirmed")
	filepath.connect("text_changed",self,"save_filepath")
	
	
	set_filepath(driver_file_path)
	set_folder_path(driver_folder_path)


func set_filepath(to):
	if to == null:
		to = ""
	Settings.set_value(driver_file_path_section,driver_file_path_setting,to)
	driver_file_path = to
	filepath.text = to

func save_filepath(to):
	if to == null:
		to = ""
	Settings.set_value(driver_file_path_section,driver_file_path_setting,to)
	driver_file_path = to

func set_folder_path(to):
	if to == null:
		to = ""
	Settings.set_value(driver_file_path_section,driver_folder_path_setting,to)
	dialog_openfile.current_dir = to

func load_file(force:bool = false):
	if file.file_exists(driver_file_path):
		var data = load(driver_file_path)
		if data:
			if needs_save and not force:
				tempstate = data.get_script_constant_map()
				dialog_unsaveddata.popup_centered()
			else:
				handle_data(data.get_script_constant_map())
		else:
			file_fail("load")
	else:
		file_fail("find")

func file_fail(mode):
	match mode:
		"find":
			var diag_txt = "Failed to find file @ [ %s ]" % driver_file_path
			dialog_errormsg.dialog_text = diag_txt
			dialog_errormsg.popup_centered()
		"load":
			var diag_txt = "Failed to load file @ [ %s ]" % driver_file_path
			dialog_errormsg.dialog_text = diag_txt
			dialog_errormsg.popup_centered()
		

var systems = []
var tempstate = {}

func handle_data(data):
	clear_list()
	for i in data:
		make_button(data[i])
	
	

func clear_list():
	systems.clear()
	for i in driverlist.get_children():
		i.queue_free()

func make_button(btn_state):
	if "system" in btn_state and "equipment_type" in btn_state and "slot_type" in btn_state:
		var sys = btn_state.system
		if sys in systems:
			pass
		else:
			systems.append(sys)
			var button = equipment_button.instance()
			button.display_system_name = sys
			button.state = btn_state
			button.connect("item_pressed",self,"equipment_button_pressed")
			state.merge({sys:btn_state})
			driverlist.add_child(button)
		if driverlist.get_child_count() > 0:
			driverlist.get_child(0).update_display_content()

signal current_equipment_item_changed(to)

func equipment_button_pressed(btn_state):
	pass


func unsaveddata_confirmed():
	handle_data(tempstate)
	tempstate.clear()

func deletesure_confirmed():
	pass

func newentry_confirmed():
	pass

func openfile_file_selected(path):
	set_filepath(path)
	set_folder_path(path.split(path.split("/")[path.split("/").size() - 1])[0])

func openfile_pressed():
	dialog_openfile.popup_centered()

func loadfile_pressed():
	load_file()

func closefile_pressed():
	pass

func savefile_pressed():
	pass

func newentry_pressed():
	pass

func deleteentry_pressed():
	pass
