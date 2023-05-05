extends CharacterBody3D

var speed = 750

var despawn_bounds

func start(pos, dir):
	rotation = dir
	position = pos
	velocity = Vector3(speed, 0, 0)
	despawn_bounds = abs(position.x) + 1000

func _physics_process(delta):
	if abs(position.x) > despawn_bounds or abs(position.y) > despawn_bounds:
		queue_free() #KILL YOURSELF
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		
		if collision.get_collider().name == "Player":
			queue_free()
		
		if collision.get_collider().has_method("hit"):
			collision.get_collider().hit()

func _on_visible_on_screen_notifier_3d_screen_exited():
	queue_free()
