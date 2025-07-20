extends StaticBody3D

func on_shot(position: Vector3):
	print("Shot at position:", position)

	var shot_at_node = $ShotAt
	if shot_at_node and shot_at_node is MeshInstance3D:
		shot_at_node.global_position = position
