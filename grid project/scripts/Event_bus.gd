extends Node
signal info(obj_name, obj_description)
@onready var ui:UI

func _ready():
	print(ui)
func send_info(obj_name, obj_description):
	pass
