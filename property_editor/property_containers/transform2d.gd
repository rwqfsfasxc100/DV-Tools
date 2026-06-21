extends VBoxContainer

func get_property_value():
	var X = $X/vec2.get_property_value()
	var Y = $X/vec2.get_property_value()
	var O = $X/vec2.get_property_value()
	var string = "Transform2D( %s , %s , %s )" % [X[1],Y[1],O[1]]
	return [Transform2D(X[0],Y[0],O[0])]
