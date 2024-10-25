extends NonPlayerCharacter

onready var mask = self

func _ready():
	add_to_group("NPC")
	add_to_group("score")
	
func interact(body):
	emit_signal("interacted", body)

func start_dialog():
	var dialog = Dialogic.start(npc + str(dialog_index))
	GlobalSettings.set_disable_input("pause")
	#LOOK OUT BELOW
	GlobalSettings.mask_score += 1
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
	if param == "mask_found":
		mask.visible = false
		$CollisionShape.disabled = true
		
