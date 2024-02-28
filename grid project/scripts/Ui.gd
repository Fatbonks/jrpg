class_name UI
extends CanvasLayer
@export var ui_info: test
@onready var name_label = %name_label
func _ready():
	if ui_info:
		ui_info.connect("changed", info)

func info():
	print("works")
