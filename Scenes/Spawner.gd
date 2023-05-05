extends StaticBody3D

const Bullet = preload("res://Scenes/Bullet.tscn")

@export var direction = Vector3(1, 0, 0)
@export var cooldown:float = 1
@export var speed = 10

var time = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if time > cooldown:
		time = 0.0
		
		shoot()

func shoot():
	var b = Bullet.instantiate()
	get_parent().add_child(b)
	b.global_position = $Muzzle.global_position
	b.velocity = direction.normalized() * speed
