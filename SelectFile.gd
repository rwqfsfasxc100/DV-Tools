extends OptionButton

onready var tabs = get_node_or_null(NodePath("../../../VBoxContainer/TabContainer")).get_children()

func _ready():
	if tabs.size() > 1:
		get_parent().visible = true
		for i in tabs:
			add_item(i.name)
		connect("item_selected",self,"_on_selected")
	else:
		get_parent().visible = false

func _on_selected(idx):
	for i in tabs:
		i.visible = false
	tabs[idx].visible = true
