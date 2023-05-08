extends Control

func _on_play_button_pressed():
	print(true)
	self.visible = false
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_retry_button_pressed():
	print(true)
	self.visible = false
	get_tree().paused = false
	get_tree().reload_current_scene()
