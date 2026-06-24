extends Tabs

const MANIFEST_VERSIONS = [
	1.0,
	2.0,
	2.1,
	2.2,
]

onready var manifest_loaders = [
	$HBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/MV1,
	$HBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/MV2,
	$HBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/MV21,
	$HBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/MV22,
]

func _ready():
	$HBoxContainer/HBoxContainer/IMPORT.connect("pressed",self,"IMPORT")
	$HBoxContainer/HBoxContainer/EXPORT.connect("pressed",self,"EXPORT")
	select_mv(manifest_loaders.size() - 1)

var current_mv : float = 2.2

func select_mv(idx:int):
	for i in manifest_loaders:
		i.visible = false
	manifest_loaders[idx].visible = true
	current_mv = MANIFEST_VERSIONS[idx]

func IMPORT():
	pass

func EXPORT():
	var out = manifest_loaders[MANIFEST_VERSIONS.find(current_mv)].EXPORT()
	FormatManifests.format(out,"user://mod.manifest")


