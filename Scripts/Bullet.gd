extends Area3D

var velocity = Vector3(3, 0, 0)
var time = 0
var exploding = false
var exploding_time = 1

func explode():
	if not exploding:
		$CollisionShape3D.disabled = true
		$MeshInstance3D.visible = false
		$CPUParticles3D.emitting = true
		$Explode.play()
		
		exploding = true

func _physics_process(delta):
	position += velocity * delta
	for body in get_overlapping_bodies():
		if body.name == "Player":
			body.hit()
		
		if not "Bullet" in body.name and not "Spawner" in body.name:
			explode()
	
	if exploding:
		time += delta
		
		if time >= exploding_time:
			queue_free()
