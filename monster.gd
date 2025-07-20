extends Node3D

@export var speed: float = 2.0
@export var distance: float = 5.0

signal monster_dead(position)

func _ready() -> void:
	speed = randf_range(-3.0, 3.0)

func on_shot(position: Vector3):
	print("Monster shot")
	emit_signal("monster_dead", position)
	queue_free()

var start_position: Vector3
var time := 0.0

func set_start_position(pos: Vector3):
	print("Set position to ", pos)
	global_position = pos
	start_position = pos

func _process(delta: float) -> void:
	time += delta
	var offset = sin(time * speed) * distance
	global_position = start_position + Vector3(offset, 0, 0)
