extends HBoxContainer

func get_property_value():
	var value = $CheckButton.pressed
	return [value,"true" if value else "false"]
