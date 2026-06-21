extends HBoxContainer

var Xvalue:float = 0.0
var Yvalue:float = 0.0
var Wvalue:float = 0.0
var Hvalue:float = 0.0

func get_property_value():
	_X_text_changed($X.text)
	_Y_text_changed($Y.text)
	_W_text_changed($W.text)
	_H_text_changed($H.text)
	return [Rect2(Xvalue,Yvalue,Wvalue,Hvalue),"Rect2( %s , %s , %s , %s )" % [str(Xvalue),str(Yvalue),str(Wvalue),str(Hvalue)]]

func _ready():
	$X.connect("text_entered",self,"_X_text_changed")
	$X.connect("focus_exited",self,"_X_lost_focus")
	$Y.connect("text_entered",self,"_Y_text_changed")
	$Y.connect("focus_exited",self,"_Y_lost_focus")
	$W.connect("text_entered",self,"_W_text_changed")
	$W.connect("focus_exited",self,"_W_lost_focus")
	$H.connect("text_entered",self,"_H_text_changed")
	$H.connect("focus_exited",self,"_H_lost_focus")

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

func _W_text_changed(text:String):
	var ft = float(text)
	$W.text = str(ft)
	Wvalue = ft

func _W_lost_focus():
	var txt = $W.text
	_W_text_changed(txt)

func _H_text_changed(text:String):
	var ft = float(text)
	$H.text = str(ft)
	Hvalue = ft

func _H_lost_focus():
	var txt = $H.text
	_H_text_changed(txt)
