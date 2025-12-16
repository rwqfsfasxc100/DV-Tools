extends Tabs

const equipment_button = preload("res://driver_panel/EquipmentButton.tscn")

export (NodePath) var system_p = NodePath("VBoxContainer/HBoxContainer/PanelContainer2/ScrollContainer/GridContainer/System Box")
onready var system = get_node(system_p)
export (NodePath) var equipment_type_p = NodePath("VBoxContainer/HBoxContainer/PanelContainer2/ScrollContainer/GridContainer/Equipment Type Box")
onready var equipment_type = get_node(equipment_type_p)
export (NodePath) var slot_type_p = NodePath("VBoxContainer/HBoxContainer/PanelContainer2/ScrollContainer/GridContainer/Slot Type Box")
onready var slot_type = get_node(slot_type_p)
export (NodePath) var num_val_p = NodePath("VBoxContainer/HBoxContainer/PanelContainer2/ScrollContainer/GridContainer/Numerical Value Box")
onready var num_val = get_node(num_val_p)
export (NodePath) var capability_lock_p = NodePath("VBoxContainer/HBoxContainer/PanelContainer2/ScrollContainer/GridContainer/Capability Lock Box")
onready var capability_lock = get_node(capability_lock_p)
export (NodePath) var name_override_p = NodePath("VBoxContainer/HBoxContainer/PanelContainer2/ScrollContainer/GridContainer/Name Override Box")
onready var name_override = get_node(name_override_p)
export (NodePath) var description_p = NodePath("VBoxContainer/HBoxContainer/PanelContainer2/ScrollContainer/GridContainer/Description Box")
onready var description = get_node(description_p)
export (NodePath) var manual_p = NodePath("VBoxContainer/HBoxContainer/PanelContainer2/ScrollContainer/GridContainer/Manual Box")
onready var manual = get_node(manual_p)
export (NodePath) var specs_p = NodePath("VBoxContainer/HBoxContainer/PanelContainer2/ScrollContainer/GridContainer/Specs Box")
onready var specs = get_node(specs_p)
export (NodePath) var price_p = NodePath("VBoxContainer/HBoxContainer/PanelContainer2/ScrollContainer/GridContainer/Price Box")
onready var price = get_node(price_p)
export (NodePath) var test_protocol_p = NodePath("VBoxContainer/HBoxContainer/PanelContainer2/ScrollContainer/GridContainer/Test Protocol Box")
onready var test_protocol = get_node(test_protocol_p)
export (NodePath) var default_p = NodePath("VBoxContainer/HBoxContainer/PanelContainer2/ScrollContainer/GridContainer/Default Box")
onready var default = get_node(default_p)
export (NodePath) var control_p = NodePath("VBoxContainer/HBoxContainer/PanelContainer2/ScrollContainer/GridContainer/Control Box")
onready var control = get_node(control_p)
export (NodePath) var story_flag_p = NodePath("VBoxContainer/HBoxContainer/PanelContainer2/ScrollContainer/GridContainer/Story Flag Box")
onready var story_flag = get_node(story_flag_p)
export (NodePath) var story_flag_min_p = NodePath("VBoxContainer/HBoxContainer/PanelContainer2/ScrollContainer/GridContainer/Story Flag Min Box")
onready var story_flag_min = get_node(story_flag_min_p)
export (NodePath) var story_flag_max_p = NodePath("VBoxContainer/HBoxContainer/PanelContainer2/ScrollContainer/GridContainer/Story Flag Max Box")
onready var story_flag_max = get_node(story_flag_max_p)
export (NodePath) var warn_if_thermal_below_p = NodePath("VBoxContainer/HBoxContainer/PanelContainer2/ScrollContainer/GridContainer/Warn If Thermal Below Box")
onready var warn_if_thermal_below = get_node(warn_if_thermal_below_p)
export (NodePath) var warn_if_electric_below_p = NodePath("VBoxContainer/HBoxContainer/PanelContainer2/ScrollContainer/GridContainer/Warn If Electric Below Box")
onready var warn_if_electric_below = get_node(warn_if_electric_below_p)
export (NodePath) var sticker_price_format_p = NodePath("VBoxContainer/HBoxContainer/PanelContainer2/ScrollContainer/GridContainer/Sticker Price Format Box")
onready var sticker_price_format = get_node(sticker_price_format_p)
export (NodePath) var sticker_price_multi_format_p = NodePath("VBoxContainer/HBoxContainer/PanelContainer2/ScrollContainer/GridContainer/Sticker Price Multi Format Box")
onready var sticker_price_multi_format = get_node(sticker_price_multi_format_p)
export (NodePath) var installed_color_p = NodePath("VBoxContainer/HBoxContainer/PanelContainer2/ScrollContainer/GridContainer/Installed Color Box")
onready var installed_color = get_node(installed_color_p)
export (NodePath) var disabled_color_p = NodePath("VBoxContainer/HBoxContainer/PanelContainer2/ScrollContainer/GridContainer/Disabled Color Box")
onready var disabled_color = get_node(disabled_color_p)
export (NodePath) var alignment_p = NodePath("VBoxContainer/HBoxContainer/PanelContainer2/ScrollContainer/GridContainer/Alignment Box")
onready var alignment = get_node(alignment_p)
export (NodePath) var restriction_p = NodePath("VBoxContainer/HBoxContainer/PanelContainer2/ScrollContainer/GridContainer/Restriction Box")
onready var restriction = get_node(restriction_p)
export (NodePath) var config_id_p = NodePath("VBoxContainer/HBoxContainer/PanelContainer2/ScrollContainer/GridContainer/Config2/Config ID")
onready var config_id = get_node(config_id_p)
export (NodePath) var config_section_p = NodePath("VBoxContainer/HBoxContainer/PanelContainer2/ScrollContainer/GridContainer/Config2/Config Section")
onready var config_section = get_node(config_section_p)
export (NodePath) var config_entry_p = NodePath("VBoxContainer/HBoxContainer/PanelContainer2/ScrollContainer/GridContainer/Config2/Config Entry")
onready var config_entry = get_node(config_entry_p)

export (NodePath) var filepath_p = NodePath("VBoxContainer/HBoxContainer/DriverPanel/VBoxContainer/VBoxContainer/HBoxContainer3/FilePath")
onready var filepath = get_node(filepath_p)
export (NodePath) var driverlist_p = NodePath("VBoxContainer/HBoxContainer/DriverPanel/VBoxContainer/MarginContainer/ScrollContainer/VBoxContainer")
onready var driverlist = get_node(driverlist_p)

export (NodePath) var button_openfile_p = NodePath("VBoxContainer/HBoxContainer/DriverPanel/VBoxContainer/VBoxContainer/HBoxContainer3/OpenFile")
onready var button_openfile = get_node(button_openfile_p)
export (NodePath) var button_loadfile_p = NodePath("VBoxContainer/HBoxContainer/DriverPanel/VBoxContainer/VBoxContainer/HBoxContainer/LoadFile")
onready var button_loadfile = get_node(button_loadfile_p)
export (NodePath) var button_closefile_p = NodePath("VBoxContainer/HBoxContainer/DriverPanel/VBoxContainer/VBoxContainer/HBoxContainer/CloseFile")
onready var button_closefile = get_node(button_closefile_p)
export (NodePath) var button_savefile_p = NodePath("VBoxContainer/HBoxContainer/DriverPanel/VBoxContainer/VBoxContainer/HBoxContainer/SaveFile")
onready var button_savefile = get_node(button_savefile_p)
export (NodePath) var button_newentry_p = NodePath("VBoxContainer/HBoxContainer/DriverPanel/VBoxContainer/VBoxContainer/HBoxContainer2/New")
onready var button_newentry = get_node(button_newentry_p)
export (NodePath) var button_deleteentry_p = NodePath("VBoxContainer/HBoxContainer/DriverPanel/VBoxContainer/VBoxContainer/HBoxContainer2/Delete")
onready var button_deleteentry = get_node(button_deleteentry_p)

export (NodePath) var dialog_deletesure_p = NodePath("Dialog/DeleteSure")
onready var dialog_deletesure = get_node(dialog_deletesure_p)
export (NodePath) var dialog_newentry_p = NodePath("Dialog/NewEntry")
onready var dialog_newentry = get_node(dialog_newentry_p)
export (NodePath) var dialog_newentry_input_p = NodePath("Dialog/NewEntry/VBoxContainer/NewEntryName")
onready var dialog_newentry_input = get_node(dialog_newentry_input_p)
export (NodePath) var dialog_newentry_exists_p = NodePath("Dialog/NewEntry/NewEntryExists")
onready var dialog_newentry_exists = get_node(dialog_newentry_exists_p)
export (NodePath) var dialog_openfile_p = NodePath("Dialog/OpenFile")
onready var dialog_openfile = get_node(dialog_openfile_p)
export (NodePath) var dialog_errormsg_p = NodePath("Dialog/ErrorMSG")
onready var dialog_errormsg = get_node(dialog_errormsg_p)
export (NodePath) var dialog_unsaveddata_p = NodePath("Dialog/UnsavedData")
onready var dialog_unsaveddata = get_node(dialog_unsaveddata_p)
export (NodePath) var dialog_blankentry_p = NodePath("Dialog/BlankEntry")
onready var dialog_blankentry = get_node(dialog_blankentry_p)

export (NodePath) var driver_panel_p = NodePath("VBoxContainer/HBoxContainer/DriverPanel")
onready var driver_panel = get_node(driver_panel_p)

export var driver_file_path_section = "add_equipment_items"
export var driver_file_path_setting = "selected_driver"
export var driver_folder_path_setting = "selected_driver_folder"

onready var driver_file_path = Settings.get_value(driver_file_path_section,driver_file_path_setting)
onready var driver_folder_path = Settings.get_value(driver_file_path_section,driver_folder_path_setting)

var file = File.new()

var state = {}

var needs_save = false

signal value_changed(opt,how)
signal update_value_to(new_state)
signal file_load_changed(is_loaded)


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
	
	
	
	
	emit_signal("file_load_changed",false)


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
				unsave_mode = "overwrite"
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
	emit_signal("file_load_changed",true)
	for i in data:
		make_button(data[i])
	if driverlist.get_children().size() > 0:
		driverlist.get_child(0).update_display_content()
	
	

func clear_list():
	systems.clear()
	for i in driverlist.get_children():
		i.queue_free()

func make_button(btn_state):
	if "system" in btn_state and "equipment_type" in btn_state and "slot_type" in btn_state:
		var sys = btn_state.system
		state.merge({sys:btn_state})
		if sys in systems:
			pass
		else:
			systems.append(sys)
			var button = equipment_button.instance()
			button.display_system_name = sys
			button.state = state[sys]
			button.connect("item_pressed",self,"equipment_button_pressed")
			
			driverlist.add_child(button)
		if driverlist.get_child_count() > 0:
			driverlist.get_child(0).update_display_content()

func equipment_button_pressed(btn_state,button):
	current_button = button
	emit_signal("update_value_to",btn_state)

var current_button

func value_updated(opt,how):
	
	var box = get(opt_to_node(opt))
	var should_save = false
	var this_default
	if box.reset_node:
		this_default = box.reset_node.default
	var this_name = current_button.display_system_name
	if this_default != how:
		
		if this_name in state:
			var this_state = state[this_name]
			if opt in this_state:
				if this_state[opt] != how:
					should_save = true
	else:
		if this_name in state:
			if opt in state[this_name]:
				state[this_name].erase(opt)
	if should_save:
		needs_save = true
	current_button.set_value(opt,how)

var unsave_mode = ""
func unsaveddata_confirmed():
	match unsave_mode:
		"overwrite":
			handle_data(tempstate)
			tempstate.clear()
		"close_data":
			close_data()
		_:
			print("Unsave mode [%s] is not handled" % unsave_mode)
	unsave_mode = ""

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
	if needs_save:
		unsave_mode = "close_data"
		dialog_unsaveddata.popup_centered()
	else:
		close_data()

func close_data():
	clear_list()
	state.clear()
	emit_signal("file_load_changed",false)

func savefile_pressed():
	pass

func newentry_pressed():
	dialog_newentry.popup_centered()

func deleteentry_pressed():
	pass

func opt_to_node(opt):
	match opt:
		"config.id":
			opt = "config_id"
		"config.section":
			opt = "config_section"
		"config.entry":
			opt = "config_entry"
	return opt

var new_entry_name = ""
func _on_NewEntryName_text_changed(new_text):
	new_entry_name = new_text


func _on_NewEntry_confirmed():
	if new_entry_name == "":
		dialog_blankentry.popup_centered()
	elif new_entry_name in state:
		dialog_newentry_exists.popup_centered()
	else:
		dialog_newentry.hide()
		dialog_newentry_input.text = ""
		var dict = {new_entry_name:{"system":new_entry_name,"equipment_type":"EQUIPMENT_MASS_DRIVERS","slot_type":"HARDPOINT"}}
		make_button(dict)
