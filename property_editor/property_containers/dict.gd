extends VBoxContainer

func get_property_value():
	var value = null
	return [value,"true" if value else "false"]
