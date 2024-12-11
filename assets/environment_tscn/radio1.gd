extends NonPlayerCharacter

func _ready():
	Dialogic.set_variable("radio_handler", 5)
	Music.stream = load("res://src/music/coldheart dancehall_loop.wav")
	Music.play()
	add_to_group("NPC")
	
func interact(body):
	emit_signal("interacted", body)

func start_dialog():
	var dialog = Dialogic.start(npc + str(dialog_index))
	GlobalSettings.set_disable_input("pause")
	dialog.pause_mode = PAUSE_MODE_PROCESS
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_parent().add_child(dialog)
	dialog.connect("timeline_end", self, "end_dialog")
	dialog.connect("dialogic_signal", self, "dialogic_signal_event")
	get_tree().paused = true
	
func end_dialog(data):
	get_tree().paused = false
	GlobalSettings.set_disable_input(false)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func dialogic_signal_event(param):
	if param == "song3":
		Dialogic.set_variable("radio_handler", 3)
		Music.stop()
		Music.stream = load("res://src/music/arp one_loop.wav")
		Music.play()
	if param == "song4":
		Dialogic.set_variable("radio_handler", 4)
		Music.stop()
		Music.stream = load("res://src/music/coldheart castle keep_loop.wav")
		Music.play()
	if param == "song5":
		Dialogic.set_variable("radio_handler", 5)
		Music.stop()
		Music.stream = load("res://src/music/coldheart dancehall_loop.wav")
		Music.play()
		