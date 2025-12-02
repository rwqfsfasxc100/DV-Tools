extends Node

var cfg_file = "user://settings.cfg"

var file = File.new()

signal settings_changed(how)

var cfg = {
	"drivers":{
		"current_dir":"",
		"references":PoolStringArray([])
	},
	"settings":{
		"output_file_path":"user://save_output.json",
		"save_file_path":"",
	},
}

func _ready():
	if not file.file_exists(cfg_file):
		file.open(cfg_file,File.WRITE)
		file.store_string("")
		file.close()
	load_config()
	save_config()

var c = ConfigFile.new()

func load_config():
	c.load(cfg_file)
	for i in cfg:
		for l in cfg[i]:
			cfg[i][l] = c.get_value(i,l,cfg[i][l])
	
func save_config():
	c.load(cfg_file)
	for i in cfg:
		for l in cfg[i]:
			c.set_value(i,l,cfg[i][l])
	c.save(cfg_file)

func get_value(section, setting):
	c.load(cfg_file)
	var val = c.get_value(section,setting)
	return val

func set_value(section,setting,value):
	if section in cfg:
		if setting in cfg[section]:
			cfg[section][setting] = value
			save_config()
			emit_signal("settings_changed",cfg)
