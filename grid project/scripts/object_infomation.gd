class_name Object_info
extends Node
@export var ui_resource: test
var Autoload: bool = false
func _ready():
	ui_resource.add_name("test")


func _on_hitbox_area_entered(area):
	pass
