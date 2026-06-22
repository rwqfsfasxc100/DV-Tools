extends MarginContainer

func get_property_value():
	var value = $TextEdit.text
	return [value,str(value)]

func set_property_value(property):
	if property is String:
		$TextEdit.text = property
