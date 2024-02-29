class_name health_component
extends Node
signal call_death
@export var object_stats: object_stats
func _ready() -> void:
	if object_stats:
		object_stats.health = object_stats.max_health
	else:
		print(object_stats, "no resource loaded")
func take_damage(damage: int) -> void:
	object_stats.health -= damage
	if object_stats.health <= 0:
		call_death.emit()
func player_death() -> void:
	print("player dead")
func enemy_death() -> void:
	owner.queue_free()
