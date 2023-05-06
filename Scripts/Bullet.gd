extends Area3D

var velocity = Vector3(3, 0, 0)

func _physics_process(delta):
	position += velocity * delta
	for body in get_overlapping_bodies():
		if body.name == "Player":
			body.bullet_hit()
		
		if not "Bullet" in body.name:
			queue_free()
