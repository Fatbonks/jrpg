class_name test
extends Resource
signal update_ui(name, descripton)
var name: String
var descripton: String

func update(obj_name:String, obj_descripton: String):
	name = obj_name
	descripton = obj_descripton
	update_ui.emit(name, descripton)
