extends MarginContainer

func get_property_value():
	var value = $SpinBox.value
	return [value,str(value)]

func set_property_value(property):
	if property is int or property is float:
		$SpinBox.value = int(property)
