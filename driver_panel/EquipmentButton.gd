extends Button

var display_system_name = "SYSTEM_EXAMPLE"

var state = {}

signal item_pressed(system,button)

func _ready():
	name = display_system_name
	text = display_system_name
	connect("pressed",self,"update_display_content")

func update_display_content():
	emit_signal("item_pressed",state,self)

func set_value(opt,how):
	var pos = state
	var v = typeof(how)
	match v:
		TYPE_COLOR:
			how = how.to_html(false)
	var p = opt.split(".")
	var depth = p.size() - 1
	for i in range(depth):
		var g = p[i]
		if not g in pos:
			pos.merge({g:{}})
		pos = pos.get(g)
	pos[p[-1]] = how
