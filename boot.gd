extends Control

var current_file = ""
var output_file = "user://save_output.txt"

export var openSave = NodePath("")
onready var openSaveFile = get_node_or_null(openSave)
export var openSaveText = NodePath("")
onready var openSaveTextPath = get_node_or_null(openSaveText)
export var openTextOutput = NodePath("")
onready var openTextOutputPath = get_node_or_null(openTextOutput)


var password = "FTWOMG"
func _on_LineEdit_text_changed(new_text):
	current_file = new_text


func _on_FileDialog_file_selected(path):
	current_file = path
	openSaveTextPath.text = path


func _on_Button_pressed():
	openSaveFile.popup_centered()


func _on_ConvertButton_pressed():
	var data = getMetaFromSave(current_file)
	if data:
		f.open(output_file,File.WRITE)
		f.store_string(JSON.print(data,"\t "))
		f.close()

var f = File.new()
func getMetaFromSave(file):
	if f.file_exists(file):
		f.open_encrypted_with_pass(file, File.READ, password)
		var sg = f.get_line()
		var savedState = parse_json(sg)
		f.close()
		return savedState
	else:
		return


func _on_Output_file_selected():
	pass # Replace with function body.
