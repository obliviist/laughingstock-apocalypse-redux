extends Spatial

onready var world_env = $WorldEnvironment

func _ready():
	world_env.environment.dof_blur_far_enabled = false
	world_env.environment.dof_blur_near_enabled = false
	Amb.stream = load("res://src/sfx/amb_loops/amb_wind.wav") 
	Amb.play()


func _on_TheUrnListener_cheat_activated():
	get_tree().change_scene("res://src/gui/world_urn_slide.tscn")


func _on_TheAbyssListener_cheat_activated():
	get_tree().change_scene("res://src/gui/world_void_slide.tscn")


func _on_TheKeepListener_cheat_activated():
	pass # Replace with function body.


func _on_TheSaloonListener_cheat_activated():
	pass # Replace with function body.


func _on_HelpListener_cheat_activated():
	pass # Replace with function body.


func _on_NoclipListener_cheat_activated():
	pass # Replace with function body.


func _on_FlyListener_cheat_activated():
	pass # Replace with function body.


func _on_HorsepowerListener_cheat_activated():
	pass # Replace with function body.
