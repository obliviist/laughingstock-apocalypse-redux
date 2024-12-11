extends Spatial

func _ready():
	Amb.stop()
	Music.stop()
	Music.stream = load("res://src/music/druids picnic_loop.wav")
	Music.play()
	$AnimationPlayer.play("intro_fade_in")

	var new_dialog = Dialogic.start('cheat_slide1')
	new_dialog.connect("dialogic_signal", self, "dialog_listener")
	add_child(new_dialog)
	new_dialog.connect("timeline_end", self, "end_dialog")

func end_dialog(data):
	get_tree().paused = false
	GlobalSettings.set_disable_input(false)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

	
func dialog_listener(string):
	match string:
		"cheat_fade_out":
			$AnimationPlayer.play("intro_fade_out")
