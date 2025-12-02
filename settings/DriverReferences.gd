extends MarginContainer

export var button = NodePath("")
onready var btn = get_node_or_null(button)

export var dialog = NodePath("")
onready var dg = get_node_or_null(dialog)

export var display_f = NodePath("")
onready var display_container = get_node_or_null(display_f)

export var file_display = preload("res://equipment_driver/parts/FileDisplay.tscn")

var file = File.new()

func _ready():
	btn.connect("pressed",self,"openDrivers")
	var paths = Settings.get_value("drivers","references")
	add_nodes(paths)

func openDrivers():
	if Settings.cfg.drivers.current_dir != "":
		dg.set_current_dir(Settings.cfg.drivers.current_dir)
	dg.popup_centered()

onready var driver_references = PoolStringArray([])

func _files_selected(paths):
	Settings.set_value("drivers","current_dir",dg.current_dir)
	add_nodes(paths)
func add_nodes(paths):
	for f in paths:
		if file.file_exists(f):
			if not f in driver_references:
				driver_references.append(f)
				var display = file_display.instance()
				display.file_path = f
				display.connect("delete",self,"removing_reference")
				display_container.add_child(display)
				Settings.set_value("drivers","references",driver_references)
		else:
			removing_reference(f)

func removing_reference(path):
	if path in driver_references:
		var idx = driver_references.find(path)
		driver_references.remove(idx)
		Settings.set_value("drivers","references",driver_references)
		
