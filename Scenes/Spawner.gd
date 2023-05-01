extends StaticBody2D

const Bullet = preload("res://Scenes/Bullet.tscn")

var time = 0.0

@export var cooldown = 1
@export var rot = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation_degrees += rot
	
	time += delta
	if time > cooldown:
		time = 0.0
		
		shoot()

func shoot():
	var b = Bullet.instantiate()
	b.start($Muzzle.global_position, rotation)
	get_parent().add_child(b)
