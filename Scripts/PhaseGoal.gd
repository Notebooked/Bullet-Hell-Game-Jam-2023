extends Area3D

var collected = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !collected:
		for body in get_overlapping_bodies():
			if body.name == "Player":
				get_node("../..").next_phase()
			
			collected = true
