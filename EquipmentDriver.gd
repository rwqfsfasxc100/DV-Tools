extends Node

var driver_state = {}
signal EquipmentDriver_file_changed(to)

var default_state = {
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




