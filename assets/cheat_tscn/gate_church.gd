extends Gate

onready var church_door_anim = get_node("church_v6/ChurchAnimationPlayer")

func _ready():
	add_to_group("level_gate")

func start_level_request_dialog():
	var dialog = Dialogic.start(gate + str(dialog_index))
	GlobalSettings.set_disable_input("pause")
	dialog.pause_mode = PAUSE_MODE_PROCESS
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_parent().add_child(dialog)
	dialog.connect("timeline_end",self, "end_dialog")
	dialog.connect("dialogic_signal", self, "dialogic_signal_event")
	get_tree().paused = true
	
func end_dialog(data):
	get_tree().paused = false
	GlobalSettings.set_disable_input(false)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func dialogic_signal_event(param):
	if param == "church_door_fall":
		church_door_anim.play("church_door_fall")
		$ChurchDoorCollisionShape.disabled = true
