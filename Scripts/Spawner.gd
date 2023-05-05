extends StaticBody3D

const Bullet = preload("res://Scenes/Bullet.tscn")

@export var direction = Vector3(1, 0, 0)
@export var cooldown:float = 1
@export var speed = 10

var able_to_shoot = false

var time = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if time > cooldown:
		time = 0.0
		
		shoot()

func shoot():
	if able_to_shoot:
		var b = Bullet.instantiate()
		add_child(b)
		b.position = $Muzzle.position
		b.velocity = direction.normalized() * speed

# Called when the node enters the scene tree for the first time.
func phase_disabled():
	able_to_shoot = false

func phase_enabled():
	able_to_shoot = true
