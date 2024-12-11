extends Label

onready var cow_derby_score = Dialogic.get_variable("cow_derby_score") 

func _process(delta):
	self.text = str(GlobalSettings.cow_derby_score)
	
func _on_Score_body_entered(body):
		if body.is_in_group("score"):
			$Sfx.stream = load("res://src/sfx/one_shots/cow_moo.wav")
			$Sfx.play()
			GlobalSettings.cow_derby_score += 1
			body.remove_from_group("score")
			
			if GlobalSettings.cow_derby_score == 1:
				Dialogic.set_variable("cow_derby_score", 1)
			if GlobalSettings.cow_derby_score == 2:
				Dialogic.set_variable("cow_derby_score", 2)
			if GlobalSettings.cow_derby_score == 3:
				Dialogic.set_variable("cow_derby_score", 3)
			if GlobalSettings.cow_derby_score == 4:
				Dialogic.set_variable("cow_derby_score", 4)
			if GlobalSettings.cow_derby_score == 5:
				Dialogic.set_variable("cow_derby_score", 5)
			if GlobalSettings.cow_derby_score == 6:
				Dialogic.set_variable("cow_derby_score", 6)
			if GlobalSettings.cow_derby_score == 7:
				Dialogic.set_variable("cow_derby_score", 7)
				
