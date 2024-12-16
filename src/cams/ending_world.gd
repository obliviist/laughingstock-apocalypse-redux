extends Spatial

onready var tracking_shot_anim = get_node("Camera/AnimationPlayer")

func _ready():
	Amb.stop()
	Amb.stream = load("res://src/sfx/amb_loops/amb_cottage.wav")
	Amb.play()

	var new_dialog = Dialogic.start('ending_world0')
	new_dialog.connect("dialogic_signal", self, "dialog_listener")
	add_child(new_dialog)
	new_dialog.connect("timeline_end", self, "end_dialog")
	

func end_dialog(data):
	get_tree().paused = false
	GlobalSettings.set_disable_input(false)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func dialog_listener(string):
	match string:
		"tracking_shot":
			tracking_shot_anim.play("cams_tracking_shot")
			# using: 0.25 easing for first frame of anim to prevent jolt
	
