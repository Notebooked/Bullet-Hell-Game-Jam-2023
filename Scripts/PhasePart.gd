extends StaticBody3D

# Called when the node enters the scene tree for the first time.
func phase_disabled():
	for child in get_children():
		if is_instance_of(child, CollisionShape3D):
			child.disabled = true
		if is_instance_of(child, MeshInstance3D):
			child.visible = false

func phase_enabled():
	for child in get_children():
		if is_instance_of(child, CollisionShape3D):
			child.disabled = false
		if is_instance_of(child, MeshInstance3D):
			child.visible = true
