extends Node3D

var current_phase = 0

func _process(delta):
	for child in get_children():
		child.phase_process(delta, child == get_current_phase_node() or (child.name == "EndPhase" and !get_current_phase_node()))

func get_current_phase_node():
	var path = "Phase" + str(current_phase)
	if has_node(path):
		return get_node(path)
	return null

func start_end_phase():
	$EndPhase.phase_activate() 

func next_phase():
	if get_current_phase_node() != null: get_current_phase_node().phase_deactivate()
	
	current_phase += 1
	
	if get_current_phase_node() == null:
		start_end_phase()
		return true

	get_current_phase_node().phase_activate()
	return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	for child in get_children():
		child.visible = true
	
	next_phase()
