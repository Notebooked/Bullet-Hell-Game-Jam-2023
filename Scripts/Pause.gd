extends Control

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			if not self.visible:
				get_tree().paused = true
				self.visible = true
			else:
				self.visible = false
				get_tree().paused = false

func _on_play_button_pressed():
	self.visible = false
	get_tree().paused = false

func _on_quit_button_pressed():
	self.visible = false
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
