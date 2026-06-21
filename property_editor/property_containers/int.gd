extends HBoxContainer

func get_property_value():
	var value = $SpinBox.value
	return [value,str(value)]
