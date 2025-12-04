extends Node

var driver_state = {}
signal EquipmentDriver_file_changed(to)

const default_state = {
	"ADD_EQUIPMENT_ITEMS":{
		"file_path":"",
		"should_save":false,
		"entries":{},
	},
	"ADD_EQUIPMENT_SLOTS":{
		"file_path":"",
		"should_save":false,
		"entries":{},
	},
	"EQUIPMENT_TAGS":{
		"file_path":"",
		"should_save":false,
		"entries":{},
	},
	"SLOT_ORDER":{
		"file_path":"",
		"should_save":false,
		"entries":{},
	},
	"SLOT_TAGS":{
		"file_path":"",
		"should_save":false,
		"entries":{},
	},
	"WEAPONSLOT_ADD":{
		"file_path":"",
		"should_save":false,
		"entries":{},
	},
	"WEAPONSLOT_MODIFY_TEMPLATES":{
		"file_path":"",
		"should_save":false,
		"entries":{},
	},
	"WEAPONSLOT_MODIFY":{
		"file_path":"",
		"should_save":false,
		"entries":{},
	},
	"WEAPONSLOT_SHIP_TEMPLATES":{
		"file_path":"",
		"should_save":false,
		"entries":{},
	},
	"WEAPONSLOT_SHIP_MODIFY":{
		"file_path":"",
		"should_save":false,
		"entries":{},
	},
	"AUX_POWER_SLOT":{
		"file_path":"",
		"should_save":false,
		"entries":{},
	},
	"MODIFY_INTERNALS":{
		"file_path":"",
		"should_save":false,
		"entries":{},
	},
	"NODE_DEFINITIONS":{
		"file_path":"",
		"should_save":false,
		"entries":{},
	},
	"SHIP_NODE_REGISTER":{
		"file_path":"",
		"should_save":false,
		"entries":{},
	},
	"SHIP_NODE_MODIFY":{
		"file_path":"",
		"should_save":false,
		"entries":{},
	},
}

var file = File.new()

func clear_driver(driver_mode):
	if driver_mode in driver_state:
		if driver_state[driver_mode]["should_save"]:
			return ERR_FILE_NO_PERMISSION
		else:
			driver_state[driver_mode] = default_state[driver_mode].duplicate(true)
			return OK

func _ready():
	driver_state = default_state.duplicate()

func load_driver(path,driver_mode):
	if not file.file_exists(path):
		return ERR_FILE_CANT_OPEN
	if not driver_mode in driver_state:
		return ERR_DOES_NOT_EXIST
	if driver_state[driver_mode]["should_save"]:
		return ERR_FILE_NO_PERMISSION
	var c = clear_driver(driver_mode)
	if c != OK:
		return c
	var data = load(path).get_script_constant_map()
	match driver_mode:
		"ADD_EQUIPMENT_ITEMS":
			for i in data:
				var item = data[i]
				var system = item.get("system",null)
				if system:
					driver_state[driver_mode]["entries"].merge({system:item})
			
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
	emit_signal("driver_updated",driver_mode)
	return OK

var panels = {}
func register_panel(mode,panel):
	if mode in panels:
		panels[mode] = panel
	else:
		panels.merge({mode:panel})

signal system_selection(mode,system)
func change_system(mode,system):
	emit_signal("system_selection",mode,system)

signal property_value_set(mode,system,property,to)
func set_value(mode,system,property,to):
	var ds = driver_state[mode]["entries"]
	if system in ds:
		pass
	else:
		ds.merge({system:{}})
	ds = ds[system]
	if property in ds:
		ds[property] = to
	else:
		ds.merge({property:to})
	emit_signal("property_value_set",mode,system,property,to)

signal driver_item_updated(driver_mode,data,system)
signal driver_updated(driver_mode)

func update_display_content(data,mode,system):
	emit_signal("driver_item_updated",mode,data,system)

func get_driver(driver):
	if driver in driver_state:
		return driver_state[driver]["entries"]
	return {}

func get_driver_system(driver,system):
	if driver in driver_state:
		if system in driver_state[driver]["entries"]:
			return driver_state[driver]["entries"][system]
	return null
func get_driver_property(driver,system,property):
	if driver in driver_state:
		if system in driver_state[driver]["entries"]:
			if property in driver_state[driver]["entries"][system]:
				return driver_state[driver]["entries"][system][property]
	return null
