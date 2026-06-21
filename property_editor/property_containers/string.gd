extends HBoxContainer

func get_property_value():
	var value = $TextEdit.text
	return [value,str(value)]
