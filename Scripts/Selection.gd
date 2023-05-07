extends Control

var button = preload("res://Scenes/LevelSelectButton.tscn")

func _ready():
	var level_num = 0
	
	for y in range(-1,2):
		for x in range(-2,3):
			level_num += 1
			var button_clone: Button = button.instantiate()
			add_child(button_clone)
			button_clone.position += size / 2 + Vector2(x,y) * 100
			button_clone.text = str(level_num)
