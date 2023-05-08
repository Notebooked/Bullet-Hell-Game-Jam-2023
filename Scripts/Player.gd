extends CharacterBody3D


const SPEED = 13.0
const JUMP_VELOCITY = 18
const GRAVITY = 45

var camera: Camera3D

var can_move = true

var was_on_floor_last = false

func _ready():
	camera = get_parent().get_node("Camera")

func lerp_rotation(direction):
	if direction.length() > 0:
		var new_rot = atan2(velocity.x,velocity.z)
		
		rotation.y = new_rot

func handle_animations(direction):
	if is_on_floor():
		if was_on_floor_last == false:
			$PlayerMesh.play_land()
		else:
			if direction.length() == 0:
				$PlayerMesh.play_idle()
			else:
				$PlayerMesh.play_run()
		was_on_floor_last = true
	else:
		if velocity.y < 0:
			$PlayerMesh.play_falling()
		else:
			$PlayerMesh.play_jump()
		was_on_floor_last = false

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
	
	handle_animations(direction)
	
	if can_move:
		move_and_slide()
		lerp_rotation(direction)

func hit():
	if can_move:
		get_node("../Gui/Hearts").took_damage()

func goal_touched():
	can_move = false
