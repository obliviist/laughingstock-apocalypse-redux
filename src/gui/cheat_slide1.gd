extends Node2D

func _ready():
	get_tree().paused = false
	
	var new_dialog = Dialogic.start('cheat_slide1')
	add_child(new_dialog)
	
	$AnimationPlayer.play("intro_fade_in")
	yield(get_tree().create_timer(8), "timeout")
	$AnimationPlayer.play("intro_fade_out")
	yield(get_tree().create_timer(4), "timeout")
	

