class_name NonPlayerCharacter
extends KinematicBody

export var npc = "npc name"
export var dialog_index = 0

signal interacted(body)

func _ready():
	add_to_group("NPC")
	
func _process(delta):
	if Input.is_action_pressed("pause"):
		get_tree().set_input_as_handled()
	#above code not working to disable pause button
	
func interact(body):
	emit_signal("interacted", body)

func start_dialog():
	var dialog = Dialogic.start(npc + str(dialog_index))
	get_tree().paused = true
	dialog.pause_mode = PAUSE_MODE_PROCESS
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_parent().add_child(dialog)
	dialog.connect("timeline_end", self, "end_dialog")

func end_dialog(data):
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
