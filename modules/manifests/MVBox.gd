extends VBoxContainer

var STATE = {}

func EXPORT():
	for i in get_children():
		if i.has_method("export_as"):
			var data = i.export_as()
			breakpoint
