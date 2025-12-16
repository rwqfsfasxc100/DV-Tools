extends Button

var display_system_name = "SYSTEM_EXAMPLE"

var state = {}

var tab

signal item_pressed(system,button)

func _ready():
	tab = get_tab()
	update_name()
	connect("pressed",self,"update_display_content")

func update_display_content():
	emit_signal("item_pressed",state,self)

func update_name():
	name = display_system_name
	text = display_system_name
	

func set_value(opt,how):
	var validSys = true
	if opt == "system":
		if how in tab.state:
			validSys = false
			tab.get_node("Dialog/NewEntryExists").popup_centered()
		else:
			rename_key(display_system_name,how)
			display_system_name = how
			update_name()
	
	
	
	
	if validSys:
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

func rename_key(from,to):
	if not from in tab.state:
		return
	var hold = tab.state[from].duplicate(true)
	tab.state.merge({to:hold})
	tab.state.erase(from)

func get_tab(p:Node = self):
	p = p.get_parent()
	if "needs_save" in p:
		return p
	else:
		return get_tab(p)

