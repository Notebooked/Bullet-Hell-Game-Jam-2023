extends MeshInstance3D

var vulnerable = false

# Called when the node enters the scene tree for the first time.
func _ready():
	await(get_tree().create_timer(10))
	
	vulnerable = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if vulnerable:
		if $Area3D.get_overlapping_bodies():
			$"../PhaseGoal".visible = true
