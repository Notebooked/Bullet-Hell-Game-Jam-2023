extends CharacterBody2D

const speed = 300

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("down"):
		direction.y += 1
	if Input.is_action_pressed("up"):
		direction.y -= 1
	
	velocity = speed * direction
	print(velocity)
	
	move_and_slide()

func _draw():
	draw_rect(Rect2(Vector2.ZERO,Vector2.ONE * 20), Color.REBECCA_PURPLE)
