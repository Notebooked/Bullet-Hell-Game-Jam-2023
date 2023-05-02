extends Camera3D

var target_position: Vector3

var position_lerp = 0.125

# Called when the node enters the scene tree for the first time.
func _ready():
	target_position = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_1):
		target_position = Vector3(0,0,25)
	if Input.is_key_pressed(KEY_2):
		target_position = Vector3(1,1,1).normalized() * 25
	
	position = lerp(position, target_position, position_lerp)
	
	look_at(Vector3.ZERO)
