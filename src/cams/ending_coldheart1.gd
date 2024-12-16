extends Spatial

func _ready():
	get_tree().paused = false
	var new_dialog = Dialogic.start('ending_coldheart1')
	add_child(new_dialog)
	Music.stop()
	Amb.stream = load("res://src/sfx/amb_loops/amb_forest.wav") 
	Amb.play()
