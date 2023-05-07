extends Node3D

var playing_anim = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	play_idle()

func play_idle():
	if playing_anim != 0:
		$AnimationPlayer.stop()
		
		var idle = $AnimationPlayer.get_animation("Idle")
		idle.loop_mode = Animation.LOOP_LINEAR
		$AnimationPlayer.play("Idle")
		
		playing_anim = 0

func play_run():
	if playing_anim != 1:
		$AnimationPlayer.stop()
		
		var anim = $AnimationPlayer.get_animation("Run")
		anim.loop_mode = Animation.LOOP_LINEAR
		$AnimationPlayer.play("Run")
		
		playing_anim = 1

func play_falling():
	if playing_anim != 2:
		$AnimationPlayer.stop()
		
		var anim = $AnimationPlayer.get_animation("Falling")
		anim.loop_mode = Animation.LOOP_LINEAR
		$AnimationPlayer.play("Falling")
		
		playing_anim = 2

func _process(delta):
	get_parent().velocity
