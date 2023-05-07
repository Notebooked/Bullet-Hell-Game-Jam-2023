extends Control

var button = preload("res://Scenes/LevelButton.tscn")

func ready():
	for x in range(-3,4):
		for y in range(-3,4):
			var button_clone = button.instantiate()
			$TextureRect/VBoxContainer.add_child(button_clone)
			button_clone.position += Vector2(x,y) * 100
