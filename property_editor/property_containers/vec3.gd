extends HBoxContainer

var Xvalue:float = 0.0
var Yvalue:float = 0.0
var Zvalue:float = 0.0

func get_property_value():
	_X_text_changed($X.text)
	_Y_text_changed($Y.text)
	_Z_text_changed($Z.text)
	return [Vector3(Xvalue,Yvalue,Zvalue),"Vector3( %s , %s , %s )" % [str(Xvalue),str(Yvalue),str(Zvalue)]]

func _ready():
	$X.connect("text_entered",self,"_X_text_changed")
	$X.connect("focus_exited",self,"_X_lost_focus")
	$Y.connect("text_entered",self,"_Y_text_changed")
	$Y.connect("focus_exited",self,"_Y_lost_focus")
	$Z.connect("text_entered",self,"_Z_text_changed")
	$Z.connect("focus_exited",self,"_Z_lost_focus")

func _X_text_changed(text:String):
	var ft = float(text)
	$X.text = str(ft)
	Xvalue = ft

func _X_lost_focus():
	var txt = $X.text
	_X_text_changed(txt)

func _Y_text_changed(text:String):
	var ft = float(text)
	$Y.text = str(ft)
	Yvalue = ft

func _Y_lost_focus():
	var txt = $Y.text
	_Y_text_changed(txt)

func _Z_text_changed(text:String):
	var ft = float(text)
	$Z.text = str(ft)
	Zvalue = ft

func _Z_lost_focus():
	var txt = $Z.text
	_Z_text_changed(txt)
