extends Control

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			if not $Control.visible:
				get_tree().paused = true
				$Control.visible = true
			else:
				$Control.visible = false
				get_tree().paused = false

func _on_pause_button_pressed():
	if not $Control.visible:
		get_tree().paused = true
		$Control.visible = true
	else:
		$Control.visible = false
		get_tree().paused = false

func _on_play_button_pressed():
	$Control.visible = false
	get_tree().paused = false

func _on_quit_button_pressed():
	$Control.visible = false
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")

func _on_retry_button_pressed():
	get_tree().reload_current_scene()
