extends Area3D

var target_position: Vector3

var starting_position = Vector3(0,75,0)

var moving = false

var level_finished = false
var level_finished_speed = 0.01
var level_finished_accel = 1.1

var target_ico_dist = 7
var target_ico_scale = 0.5

var icosphere_particle_size = 0.2

var player: CharacterBody3D

var player_lerp_amount = 0

var next_level_height = 70

func _ready():
	target_position = position
	position = starting_position + Vector3(position.x,0,position.z)

func phase_activated():
	$Icosphere.cast_shadow = true
	moving = true

func move_icospheres():
	$IcosphereParticles.scale = lerp($IcosphereParticles.scale, Vector3.ONE * target_ico_scale, 0.125)
	for particle in $IcosphereParticles.get_children():
		particle.scale = Vector3.ONE * icosphere_particle_size / $IcosphereParticles.scale

func clone_icospheres():
	for x in range(-1,2):
		for y in range(-1,2):
			for z in range(-1,2):
				var new_ico = $Icosphere.duplicate()
				
				new_ico.set_script(null)
				
				$IcosphereParticles.add_child(new_ico)
				
				new_ico.position = Vector3(x,y,z).normalized() * target_ico_dist
				
	$Icosphere.visible = false

func _process(delta):
	if level_finished:
		level_finished_speed *= level_finished_accel
		position.y += level_finished_speed
		player_lerp_amount = lerpf(player_lerp_amount, 1, 0.01)
		player.position = lerp(player.position, position, player_lerp_amount)

		move_icospheres()
		
		if player.position.y > next_level_height:
			print(get_tree().current_scene.name)
			get_tree().change_scene_to_file("res://Scenes/Level" + str(int(str(get_tree().current_scene.name))+1) + ".tscn")

		return

	if moving:
		position = lerp(position, target_position, 0.05)
	for body in get_overlapping_bodies():
		if body.name == "Player":
			body.goal_touched()
			
			level_finished = true
			
			player = body
			
			clone_icospheres()
