extends HBoxContainer

var Xvalue:float = 0.0
var Yvalue:float = 0.0

func get_property_value():
	_X_text_changed($X.text)
	_Y_text_changed($Y.text)
	return [Vector2(Xvalue,Yvalue),"Vector2( %s , %s )" % [str(Xvalue),str(Yvalue)]]

func _ready():
	$X.connect("text_entered",self,"_X_text_changed")
	$X.connect("focus_exited",self,"_X_lost_focus")
	$Y.connect("text_entered",self,"_Y_text_changed")
	$Y.connect("focus_exited",self,"_Y_lost_focus")

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
