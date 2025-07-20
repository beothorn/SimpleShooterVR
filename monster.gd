extends Node3D

signal monster_dead(position)

func on_shot(position: Vector3):
	print("Monster shot")
	emit_signal("monster_dead", position)
	queue_free()
