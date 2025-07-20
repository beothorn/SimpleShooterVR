extends XROrigin3D

var push_offset := Vector3.ZERO

func _process(delta):
	# Smoothly decay the push over time
	push_offset = push_offset.move_toward(Vector3.ZERO, delta * 2.0)
	# Apply the push by modifying the origin's transform
	global_position += push_offset
