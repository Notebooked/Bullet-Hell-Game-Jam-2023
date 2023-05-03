extends Node3D

var time_while_activated = 0.0

var activated = false

@export var timed = false
@export var time_until_deactivation = 5.0

@export var camera_preset = 0 #0 is Use custom
@export var custom_camera_position_target = Vector3()
@export var custom_camera_rotation_target = Vector3()

# Called when the node enters the scene tree for the first time.
func phase_activate():
	activated = true
	
	for child in self.get_children():
		child.phase_enabled()
	
	var camera: Camera3D = get_node("../../Camera")
	if camera_preset == 0:
		camera.target_position = custom_camera_position_target
		camera.target_rotation = custom_camera_rotation_target
	else:
		camera.set_preset(camera_preset)

# Called when the node enters the scene tree for the first time.
func phase_deactivate():
	activated = false
	
	for child in self.get_children():
		child.phase_disabled()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	self.phase_deactivate()

func _process(delta):
	if activated:
		time_while_activated += delta
		
		if timed and time_while_activated >= time_until_deactivation:
			print(true)
			var phases = get_parent()
			phases.next_phase()
