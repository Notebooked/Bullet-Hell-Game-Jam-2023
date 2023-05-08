extends Control

func _on_play_button_pressed():
	SceneTransition.change_scene("res://Scenes/Levels/Level1.tscn")

func _on_quit_button_pressed():
	get_tree().quit()

func _on_level_select_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Selection.tscn")

func _on_about_button_pressed():
	OS.shell_open("https://youthdevstudios.github.io")
