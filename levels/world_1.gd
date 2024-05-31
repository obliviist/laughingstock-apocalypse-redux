extends Spatial

onready var world_env = $WorldEnvironment

func _ready():
	world_env.environment.dof_blur_far_enabled = false
	world_env.environment.dof_blur_near_enabled = false
	Amb.stream = load("res://src/sfx/amb_loops/amb_wind.wav") 
	Amb.play()

