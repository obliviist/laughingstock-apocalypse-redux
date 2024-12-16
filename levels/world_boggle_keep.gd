extends Spatial

onready var world_env = $WorldEnvironment

func _ready():
	get_tree().paused = false
	GlobalSettings.set_disable_input(false)
	world_env.environment.dof_blur_far_enabled = false
	world_env.environment.dof_blur_near_enabled = false
	Music.stop()
	Music.stream = load("res://src/music/boggle castle keep_loop.wav")
	Music.play()
	
