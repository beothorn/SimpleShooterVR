extends Node3D

@export var monster_scene: PackedScene
@onready var spawn_area = $SpawnArea

func _ready():
	randomize()
	spawn_monster()

func spawn_monster():
	if monster_scene:
		var monster = monster_scene.instantiate()
		add_child(monster)

		monster.name = "Monster"
		monster.monster_dead.connect(_on_monster_dead)

		var position = get_random_position_in_area()
		monster.global_position = position

func _on_monster_dead(position: Vector3) -> void:
	print("Monster died at:", position)
	spawn_monster()

func get_random_position_in_area() -> Vector3:
	var area_transform = spawn_area.global_transform
	var box_shape = spawn_area.get_node("CollisionShape3D").shape as BoxShape3D
	var extents = box_shape.extents

	var local_pos = Vector3(
		randf_range(-extents.x, extents.x),
		randf_range(-extents.y, extents.y),
		randf_range(-extents.z, extents.z)
	)

	# Convert local position to global using the transform
	return area_transform.origin + area_transform.basis * local_pos
