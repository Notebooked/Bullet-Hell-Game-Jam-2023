extends Control

@export var heart_scene: PackedScene

@export var starting_hearts = 3

var spacing = 0

var hit_cooldown = 0.5
var time_since_last_hit = 0

func _ready():
	for i in range(starting_hearts):
		var new_heart = heart_scene.instantiate()
		add_child(new_heart)
		
		new_heart.size.x = size.y
		new_heart.size.y = size.y
		new_heart.position.x = i * (size.y + spacing)

func _process(delta):
	time_since_last_hit += delta

func took_damage():
	if time_since_last_hit >= hit_cooldown:
		if len(get_children()) > 1:
			remove_child(get_children()[-1])
		else:
			remove_child(get_children()[-1])
			get_tree().paused = true
			$"../DeathMenu".visible = true
		time_since_last_hit = 0
