extends Control

func _on_play_button_pressed():
	self.visible = false
	get_tree().paused = false
	get_tree().reload_current_scene()
