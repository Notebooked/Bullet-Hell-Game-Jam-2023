extends Camera3D

var target_position: Vector3
var target_rotation: Vector3

var lerp_value = 0.125

var rotation_mode = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	target_position = position

func set_preset(preset, instant = false):
	if preset == 1:
		target_position = Vector3(0,0,25)
		target_rotation = Vector3(0,0,0)
		rotation_mode = 1
	if preset == 2:
		target_position = Vector3(1,1,1).normalized() * 25
		var angle = rad_to_deg(Vector3(1,1,1).angle_to(Vector3(1,1,0)))
		target_rotation = Vector3(-angle,45,0)
		rotation_mode = 2
	if preset == 3:
		target_position = Vector3(0,25,0)
		target_rotation = Vector3(-90,0,0)
		rotation_mode = 3
	if instant:
		position = target_position
		rotation_degrees = target_rotation

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_1):
		set_preset(1)
	if Input.is_key_pressed(KEY_2):
		set_preset(2)
	if Input.is_key_pressed(KEY_3):
		set_preset(3)
	
	position = lerp(position, target_position, lerp_value)
	rotation_degrees = lerp(rotation_degrees, target_rotation, lerp_value)
