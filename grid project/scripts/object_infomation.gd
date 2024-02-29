extends Node
@export_category("object info")
@export var obj_name: String
@export_multiline var obj_descripton: String
@export_category("required resource for info")
@export var ui_resource: test
func _on_hitbox_area_entered(area):
	if ui_resource:
		ui_resource.update(obj_name, obj_descripton)
	else:
		printerr(ui_resource, "no resource")


func _on_hitbox_area_exited(area):
	if ui_resource:
		ui_resource.update("name:", "descripton:")
	else:
		printerr(ui_resource, "no resource")
