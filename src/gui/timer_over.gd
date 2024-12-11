extends Control

onready var timer = get_node("Timer")

var seconds = 11

func _ready():
	
	timer.set_wait_time(1.1)
	
	timer.start()

func _on_Timer_timeout():
	
	seconds -= 1
	
	get_node("Time").set_text(str(seconds))
	
	if seconds == 0:
		
		get_tree().change_scene("res://src/gui/gameover_menu.tscn")
		

