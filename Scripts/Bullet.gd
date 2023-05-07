extends Area3D

var velocity = Vector3(3, 0, 0)
var time = 0

func _physics_process(delta):
	position += velocity * delta
	for body in get_overlapping_bodies():
		if body.name == "Player":
			body.bullet_hit()
		
		if not "Bullet" in body.name and not "Spawner" in body.name:
			$CollisionShape3D.disabled = true
			$MeshInstance3D.visible = false
			
			$GPUParticles3D.emitting = true
			
			time = delta
			
			if delta == time + 0.25:
				queue_free()
