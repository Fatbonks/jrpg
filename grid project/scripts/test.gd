class_name test
extends Resource
signal update_ui()
var name: String
var descripton: String

func add_name(obj_name:String):
	name = obj_name
	emit_changed()
