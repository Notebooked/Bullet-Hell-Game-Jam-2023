extends Control

@export var heart_scene: PackedScene

@export var starting_hearts = 3

var spacing = 10

var hit_cooldown = 0.1
var time_since_last_hit = 0

var dead = false

func _ready():
	for i in range(starting_hearts):
		var new_heart = heart_scene.instantiate()
		add_child(new_heart)
		
		new_heart.size.x = size.y
		new_heart.size.y = size.y
		new_heart.position.x = i * (size.y + spacing)

func _process(delta):
	time_since_last_hit += delta
	
	if dead:
		Music.pitch_scale *= 0.9

func took_damage():
	if time_since_last_hit >= hit_cooldown:
		$HitSound.play()
		
		if len(get_children()) <= 2:
			$"../DeathMenu".visible = true
			dead = true
			
			get_tree().reload_current_scene() #REMOVE THIS LINE FOR DYING MENU
			
		if len(get_children()) > 0:
			remove_child(get_children()[-1])
		time_since_last_hit = 0
