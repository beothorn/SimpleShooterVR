extends StaticBody3D

func on_shot(position: Vector3):
	print("Shot at position:", position)
	print("Parent:", get_parent())
	get_parent().on_shot(position)
