extends Label

onready var coldheart_score = Dialogic.get_variable("coldheart_score") 

func _process(delta):
	self.text = str(GlobalSettings.coldheart_score)
	
func _on_Score_body_entered(body):
		if body.is_in_group("score"):
			$Sfx.stream = load("res://src/sfx/one_shots/voice_coldheart_hit.wav")
			$Sfx.play()
			GlobalSettings.coldheart_score -= 18
			body.remove_from_group("score")
			
			if GlobalSettings.coldheart_score == 100:
				Dialogic.set_variable("coldheart_score", 82)
			if GlobalSettings.coldheart_score == 82:
				Dialogic.set_variable("coldheart_score", 64)
			if GlobalSettings.coldheart_score == 64:
				Dialogic.set_variable("coldheart_score", 46)
			if GlobalSettings.coldheart_score == 46:
				Dialogic.set_variable("coldheart_score", 28)
			if GlobalSettings.coldheart_score == 28:
				Dialogic.set_variable("coldheart_score", 10)
			if GlobalSettings.coldheart_score == 10:
				Dialogic.set_variable("coldheart_score", -8)
			if GlobalSettings.coldheart_score == -8:
				get_tree().change_scene("res://src/cams/ending_coldheart_1.tscn")

