extends CharacterBody3D

@export_category("Player movement")
@export var player_step: int = 1
@export var player_speed: float = 0.5
@onready var forward: RayCast3D = %forward
@onready var backward: RayCast3D = %backward
@onready var camera: Camera3D = %Camera3D
var can_move: bool = true
func _ready():
	change_raycast_length(Vector3(0, 0, player_step))

func _physics_process(delta):
	if Input.is_action_pressed("ui_up") and !forward.get_collider() and can_move == true:
		animate_movement(Vector3(0, 0, -player_step), forward)
	elif Input.is_action_pressed("ui_down") and !backward.get_collider() and can_move == true:
		animate_movement(Vector3(0, 0, player_step), backward)
	elif Input.is_action_pressed("ui_left") and can_move == true:
		animate_rotation(deg_to_rad(90))
	elif Input.is_action_pressed("ui_right") and can_move == true:
		animate_rotation(deg_to_rad(-90))


func animate_movement(Movement_length: Vector3, Raycast: RayCast3D) -> void:
	change_raycast_length(Vector3(0, 0, player_step))
	var next_pos = Raycast.to_global(Movement_length)
	next_pos.y = global_position.y
	next_pos = next_pos.round()
	can_move = false
	var tween = create_tween()
	tween.tween_property(self, "global_position", next_pos, player_speed)
	await tween.finished
	can_move = true

func animate_rotation(amount_rotation: float) -> void:
	can_move = false
	var tween = create_tween()
	var rot = global_rotation + Vector3(0, amount_rotation, 0)
	tween.tween_property(self, "global_rotation", rot, player_speed)
	await tween.finished
	can_move = true

func change_raycast_length(move_length: Vector3) -> void:
	forward.target_position = -move_length
	backward.target_position = move_length
