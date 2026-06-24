extends Node

var cfg = {
	"last_seen_files":{
		"manifest":"",
	},
	
}

var CfgPath = "user://settings.cfg"
var CfgFile = ConfigFile.new()

var cfg_default = {}

func _ready():
	var dir = Directory.new()
	dir.make_dir("user://cfg")
	load_cfg_FromFile()
	save_cfg_ToFile()

func store_value(section:String,setting:String,value):
	if not section in cfg:
		cfg[section] = {}
	cfg[section][setting] = value
	save_cfg_ToFile()

func save_cfg_ToFile():
	for section in cfg:
		for key in cfg[section]:
			CfgFile.set_value(section, key, cfg[section][key])
	CfgFile.save(CfgPath)


func load_cfg_FromFile():
	if cfg_default.size() == 0:
		cfg_default = cfg.duplicate(true)
	var error = CfgFile.load(CfgPath)
	if error != OK:
		return 
	for section in cfg:
		for key in cfg[section]:
			cfg[section][key] = CfgFile.get_value(section, key, cfg[section][key])
