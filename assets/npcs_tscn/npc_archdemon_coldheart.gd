extends NonPlayerCharacter

onready var coldheart_anim = get_node("CircleAnimationPlayer")
onready var coldheart_score = Dialogic.get_variable("coldheart_score")

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
	get_tree().paused = true

func end_dialog(data):
	get_tree().paused = false
	GlobalSettings.set_disable_input(false)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	

func _on_Score_body_entered(body):

		if GlobalSettings.coldheart_score == 100:
			coldheart_anim.play("coldheart_float_pogo", -1, 1.0)
		if GlobalSettings.coldheart_score == 64:
			coldheart_anim.play("coldheart_float_circle", -1, 1.0)
		if GlobalSettings.coldheart_score == 28:
			coldheart_anim.play("coldheart_float_annoyed", -1, 1.0)

