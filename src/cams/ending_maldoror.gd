extends Spatial

func _ready():
	Music.stop()
	get_tree().paused = false
	var new_dialog = Dialogic.start('ending_maldoror0')
	add_child(new_dialog)

