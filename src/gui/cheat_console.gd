extends Control

var lineEditRef : LineEdit = null
var isHeldDown := false

func _ready():
	lineEditRef = $CenterContainer/LineEdit

func _input(event):
	if event.is_action_pressed("command_line") && !isHeldDown:
		visible = !visible
		isHeldDown = true
		if visible:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			lineEditRef.grab_focus()
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		clearText()
	elif event.is_action_released("command_line") && isHeldDown:
		isHeldDown = false
		clearText()

func _on_LineEdit_text_entered(text : String):
	# might need some code in here to connect the Listener to this. check back later / check CommandLine.gdscript
	clearText()
	
func clearText():
	lineEditRef.text = ""
