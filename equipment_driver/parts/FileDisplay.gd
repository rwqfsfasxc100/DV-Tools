extends HBoxContainer

export var file_path = ""

signal delete(file_path)

func _ready():
	$Button.connect("pressed",self,"delete_file")
	$ScrollContainer/Label.text = file_path
	rect_min_size = Vector2(0,30)

func delete_file():
	emit_signal("delete",file_path)
	self.queue_free()
