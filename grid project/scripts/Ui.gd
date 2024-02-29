class_name UI
extends CanvasLayer
@export var ui_info: test
@onready var name_label = %name_label
func _ready():
	if ui_info:
		ui_info.update_ui.connect(info)

func info(obj_name: String, obj_descripton:String):
	print(obj_name, obj_descripton)
