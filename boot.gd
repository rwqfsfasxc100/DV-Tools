extends Control

var current_file = ""
var output_file = "user://save_output.txt"
var config_file = "user://config"

export var openSave = NodePath("")
onready var openSaveFile = get_node_or_null(openSave)
export var saveBox = NodePath("")
onready var saveBoxMenu = get_node_or_null(saveBox)
export var openSaveText = NodePath("")
onready var openSaveTextPath = get_node_or_null(openSaveText)
export var openTextOutput = NodePath("")
onready var openTextOutputPath = get_node_or_null(openTextOutput)
export var tree_path = NodePath("")
onready var tree = get_node_or_null(tree_path)

var savedState = {}

var password = "FTWOMG"
func _on_LineEdit_text_changed(new_text):
	current_file = new_text
	saveCFG("settings", "save_file_path", new_text)


func _on_FileDialog_file_selected(path):
	current_file = path
	openSaveTextPath.text = path
	saveCFG("settings", "save_file_path", path)


func _on_Button_pressed():
	openSaveFile.popup_centered()


func _on_ConvertButton_pressed():
	getMetaFromSave(current_file)
	

func saveToText():
	if savedState.keys().size() > 0:
		f.open(output_file,File.WRITE)
		f.store_string(JSON.print(savedState,"\t "))
		f.close()

var f = File.new()
func getMetaFromSave(file):
	if f.file_exists(file):
		f.open_encrypted_with_pass(file, File.READ, password)
		var sg = f.get_line()
		savedState = parse_json(sg)
		f.close()


func _on_Output_file_selected(path):
	output_file = path
	openSaveTextPath.text = path
	saveCFG("settings", "output_file_path", path)

func saveCFG(section,setting,value):
	Settings.set_value(section,setting,value)
func getCFG(section,setting):
	return Settings.get_value(section,setting)

func _ready():
	output_file = ProjectSettings.globalize_path(getCFG("settings","output_file_path"))
	openTextOutputPath.text = output_file
	current_file = ProjectSettings.globalize_path(getCFG("settings","save_file_path"))
	openSaveTextPath.text = current_file


func _on_Button2_pressed():
	saveBoxMenu.popup_centered()


func _on_LineEdit2_text_changed(new_text):
	output_file = new_text
	saveCFG("settings", "output_file_path", new_text)


func _on_TreeView_pressed():
	var root = tree.create_item()
	tree.set_hide_root(true)
	for i in savedState:
		handleDict({i:savedState[i]},root)

var spacer = "- "
var blanker = " "

func handleDict(dict,root,depth = 0):
	var dtype = typeof(dict)
	if dtype != TYPE_ARRAY and dtype != TYPE_DICTIONARY:
		var item2 = tree.create_item(root)
		item2.set_collapsed(true)
		var space = ""
		for _c in range(depth):
			space = space + blanker
		item2.set_text(0,space + spacer + str(dict))
	else:
		for i in dict:
			var item = tree.create_item(root)
			item.set_collapsed(true)
			var ispace = ""
			for _c in range(depth + 1):
				ispace = ispace + blanker
			item.set_text(0,ispace + spacer + str(i))
			var type = typeof(dict[i])
			if type == TYPE_DICTIONARY:
				handleDict(dict[i],item,depth + 1)
			elif type == TYPE_ARRAY:
				handleDict(i,item, depth + 1)
			else:
				var item2 = tree.create_item(item)
				item2.set_collapsed(true)
				item2.set_text(0,ispace + spacer + str(dict[i]))

export var convert_to_text_btn = NodePath("")
onready var cvt_btn = get_node_or_null(convert_to_text_btn)
export var visualize_tree = NodePath("")
onready var showTree = get_node_or_null(visualize_tree)

func _physics_process(_delta):
	if savedState.keys().size() > 0:
		cvt_btn.disabled = false
		showTree.disabled = false
	else:
		cvt_btn.disabled = true
		showTree.disabled = true


func _on_ConvertToText_pressed():
	saveToText()
