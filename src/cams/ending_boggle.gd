extends Spatial

func _ready():
	get_tree().paused = false
	var new_dialog = Dialogic.start('ending_boggle0')
	add_child(new_dialog)
	Amb.stream = load("res://src/sfx/amb_loops/amb_wind.wav") 
	Amb.play()
