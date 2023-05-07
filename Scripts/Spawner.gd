extends StaticBody3D

const Bullet = preload("res://Scenes/Bullet.tscn")

@export var cooldown:float = 1
@export var speed = 10
@export var target = false
@export var start_wait:float = 0.0

var start_wait_finished = false
var start_wait_time = 0

var shoot_offset = 0.2

var able_to_shoot = false

var time = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target:
		look_at($"root/Player".global_position)
	
	if able_to_shoot:
		if not start_wait_finished:
			start_wait_time += delta
			
			if start_wait_time >= start_wait:
				start_wait_finished = true
				
				shoot()
		else:
			time += delta
			if time >= cooldown:
				time = 0.0
				
				shoot()

func shoot():
	var b = Bullet.instantiate()
	add_child(b)
	var forward = Vector3(1,0,0)
	b.position = forward * shoot_offset
	b.velocity = forward * speed

# Called when the node enters the scene tree for the first time.
func phase_deactivated():
	able_to_shoot = false

func phase_activated():
	able_to_shoot = true
