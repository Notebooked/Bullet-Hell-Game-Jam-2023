extends CharacterBody3D


const SPEED = 15.0
const JUMP_VELOCITY = 18
const GRAVITY = 45

var camera: Camera3D

func _ready():
	camera = get_parent().get_node("Camera")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= GRAVITY * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and camera.rotation_mode != 3:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var input_dir = Input.get_vector("left", "right", "up", "down")
	if camera.rotation_mode == 1: input_dir.y = 0
	var direction = (Vector3(input_dir.x, 0, input_dir.y)).rotated(Vector3.UP,camera.rotation.y).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()