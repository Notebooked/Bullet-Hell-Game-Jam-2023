extends MeshInstance3D

var colors = [
	Color.RED,
	Color.ORANGE,
	Color.YELLOW,
	Color.GREEN,
	Color.BLUE,
	Color.INDIGO,
	Color.VIOLET
]

var dist_to_next_color = 0.0
var current_color_index = 0
var next_color_index = 1
var color_speed = 1

var time = 0

var fly_dist = 0.5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mat:StandardMaterial3D = material_override
	
	dist_to_next_color += delta
	if dist_to_next_color > color_speed:
		dist_to_next_color = 0
		current_color_index += 1
		next_color_index += 1
		
		if current_color_index >= len(colors):
			current_color_index = 0
		if next_color_index >= len(colors):
			next_color_index = 0
	
	mat.albedo_color = lerp(colors[current_color_index],colors[next_color_index],dist_to_next_color / color_speed)
	
	rotation.x += 2 * delta
	rotation.y += 1.5 * delta
	rotation.z += 1 * delta
	
	time += delta
	
	position.y = sin(time) ** 2 * fly_dist
