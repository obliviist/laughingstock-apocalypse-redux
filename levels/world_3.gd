extends Spatial

onready var world_env = $WorldEnvironment
onready var ajax_anim = get_node("Ajax/ajax/AjaxAnimationPlayer")

func _ready():
	get_tree().paused = false
	world_env.environment.dof_blur_far_enabled = false
	world_env.environment.dof_blur_near_enabled = false
	Amb.stop()
	Amb.stream = load("res://src/sfx/amb_loops/amb_wind.wav") 
	Amb.play()
	ajax_anim.play("ajax_idle")

