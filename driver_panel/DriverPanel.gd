extends PanelContainer

export var fp = NodePath("VBoxContainer/VBoxContainer/FilePath")
onready var file_path = get_node_or_null(fp)

export var of = NodePath("VBoxContainer/VBoxContainer/HBoxContainer/OpenFile")
onready var open_file = get_node_or_null(of)
export var cf = NodePath("VBoxContainer/VBoxContainer/HBoxContainer/OpenFile")
onready var close_file = get_node_or_null(cf)
export var sf = NodePath("VBoxContainer/VBoxContainer/HBoxContainer/OpenFile")
onready var save_file = get_node_or_null(sf)

