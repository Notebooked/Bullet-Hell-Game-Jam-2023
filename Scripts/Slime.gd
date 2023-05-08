extends Area3D

func _physics_process(delta):
	for body in get_overlapping_bodies():
		if body.name == "Player":
			body.hit()

func phasing_in():
	$CPUParticles3D.visible = true

func phasing_out():
	$CPUParticles3D.visible = false
