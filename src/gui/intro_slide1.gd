extends Node2D

func _ready():
	
	$AnimationPlayer.play("intro_fade_in")
<<<<<<< Updated upstream
=======
	Sfx.stream = load("res://src/sfx/one_shots/Synth-SpaceJazzUpwards.wav")
	Sfx.play()
>>>>>>> Stashed changes
	yield(get_tree().create_timer(4), "timeout")
	$AnimationPlayer.play("intro_fade_out")
	yield(get_tree().create_timer(2), "timeout")
	get_tree().change_scene("res://src/gui/intro_slide2.tscn")
