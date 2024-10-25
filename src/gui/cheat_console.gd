extends Control

var lineEditRef : LineEdit = null
var isHeldDown := false
var is_paused = false setget set_is_paused

func _ready():
	lineEditRef = $CenterContainer/LineEdit

func _input(event):
	if event.is_action_pressed("command_line") && !isHeldDown:
		Sfx.stream = load("res://src/sfx/one_shots/Synth-RolandishHi.wav")
		Sfx.play()
		visible = !visible
		isHeldDown = true
		self.is_paused = !is_paused
		if visible:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			lineEditRef.grab_focus()
		clearText()
	elif event.is_action_released("command_line") && isHeldDown:
		isHeldDown = false
		clearText()
		self.is_paused = is_paused

func _on_LineEdit_text_entered(text : String):
	clearText()
	
func clearText():
	lineEditRef.text = ""
	
func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func noclip():
	GlobalSettings.playerRef.noclip()
	
func fly():
	GlobalSettings.playerRef.fly()


