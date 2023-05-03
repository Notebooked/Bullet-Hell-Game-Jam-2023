extends Node3D

var current_phase = 0

func get_current_phase_node():
	var path = "Phase" + str(current_phase)
	if has_node(path):
		return get_node(path)
	return null
	
func next_phase():
	if get_current_phase_node() != null: get_current_phase_node().phase_deactivate()
	
	current_phase += 1
	
	if get_current_phase_node() == null:
		return #END GAME HJERE!!!!!!!!!!!!
	
	get_current_phase_node().phase_activate()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	next_phase()
