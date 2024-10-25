extends NonPlayerCharacter

onready var spider = self

func _ready():
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
	if param == "hide_and_seek":
		spider.visible = false
		$CollisionShape1.disabled = true
		$CollisionShape2.disabled = true
		$CollisionShape3.disabled = true
		$CollisionShape4.disabled = true
		
