extends Node3D

var time_while_activated = 0.0

@export var timed = false #if not timed then there is a phase goal
@export var time_until_deactivation = 5.0

@export var camera_preset = 0 #0 is Use custom
@export var custom_camera_position_target = Vector3()
@export var custom_camera_rotation_target = Vector3()
@export var set_camera_preset_instantly = false

var phase_in_alpha_lerp = 0.125

# Called when the node enters the scene tree for the first time.
func phase_activate():
	for phasepart in get_children():
		if phasepart.has_method("phase_activated"):
			phasepart.phase_activated()
	
	var camera: Camera3D = get_node("../../Camera")
	if camera_preset == 0:
		camera.target_position = custom_camera_position_target
		camera.target_rotation = custom_camera_rotation_target
	else:
		camera.set_preset(camera_preset, set_camera_preset_instantly)

# Called when the node enters the scene tree for the first time.
func phase_deactivate():
	for phasepart in get_children():
		if phasepart.has_method("phase_deactivated"):
			phasepart.phase_deactivated()

func phase_in_phaseparts():
	for phasepart in get_children():
		for child in phasepart.get_children():
			print(child.name)
			if is_instance_of(child, CollisionShape3D):
				child.disabled = false
			if is_instance_of(child, MeshInstance3D):
				child.transparency = lerpf(child.transparency, 0.0, phase_in_alpha_lerp)
	print("0000")

func phase_out_phaseparts():
	for phasepart in get_children():
		for child in phasepart.get_children():
			if is_instance_of(child, CollisionShape3D):
				child.disabled = true
			if is_instance_of(child, MeshInstance3D):
				child.transparency = lerpf(child.transparency, 1.0, phase_in_alpha_lerp)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _enter_tree():
	for phasepart in get_children():
		for child in phasepart.get_children():
			if is_instance_of(child, CollisionShape3D):
				child.disabled = true
			if is_instance_of(child, MeshInstance3D):
				print(child.name)
				child.transparency = 1.0

func phase_process(delta, activated):
	if activated:
		time_while_activated += delta
		
		phase_in_phaseparts()
		
		if timed and time_while_activated >= time_until_deactivation:
			var phases = get_parent()
			phases.next_phase()
	else:
		phase_out_phaseparts()
