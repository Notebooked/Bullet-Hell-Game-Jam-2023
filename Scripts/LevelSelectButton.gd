extends Button

func _on_pressed():
	SceneTransition.change_scene("res://Scenes/Levels/Level" + text + ".tscn")
