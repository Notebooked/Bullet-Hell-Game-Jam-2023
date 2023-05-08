extends Control

var button = preload("res://Scenes/LevelSelectButton.tscn")

func _ready():
	var level_num = 0
	
	for y in range(-1,1):
		for x in range(-1,3):
			level_num += 1
			var button_clone: Button = button.instantiate()
			add_child(button_clone)
			button_clone.position += size / 2 + Vector2(x,y) * 100 - Vector2(50, 100)
			button_clone.text = str(level_num)


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
