extends KinematicBody2D

var gravity: float = 8;
var speed: float = 20;
var jump_speed: float = -200;
var max_speed: float = 200;
var floor_deceleration: float = 0.8;
var air_deceleration: float = 0.9;

var velocity: Vector2;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func calculate_movement():
	var move = Vector2()
	
	if Input.is_action_pressed("left"):
		velocity.x -= speed
	if Input.is_action_pressed("right"):
		velocity.x += speed
	if Input.is_action_just_pressed("jump"):
		velocity.y = jump_speed

func _process(delta):
	calculate_movement()
	
	if velocity.x > max_speed:
		velocity.x = max_speed
	if velocity.x < -max_speed:
		velocity.x = -max_speed
	
	velocity.y += gravity
	
	self.move_and_slide(velocity,Vector2.UP)
	
	if self.is_on_floor() or self.is_on_ceiling():
		velocity.y = 0
	
	if not Input.is_action_pressed("left") or not Input.is_action_pressed("right"):
		velocity.x *= floor_deceleration
	else:
		velocity.x *= air_deceleration
