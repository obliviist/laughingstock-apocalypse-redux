extends Label

onready var cow_score = Dialogic.get_variable("cow_score") 
onready var mask_score = Dialogic.get_variable("abyss_mask_score")

func _process(delta):
	self.text = str(GlobalSettings.cow_score)
	self.text = str(GlobalSettings.mask_score)
	
func _on_Score_body_entered(body):
		if body.is_in_group("score"):
			$Sfx.stream = load("res://src/sfx/one_shots/cow_moo.wav")
			$Sfx.play()
			GlobalSettings.score += 1
			body.remove_from_group("score")
			
			if GlobalSettings.score == 1:
				Dialogic.set_variable("cow_score", 1)
				Dialogic.set_variable("abyss_mask_score", 1)
			if GlobalSettings.score == 2:
				Dialogic.set_variable("cow_score", 2)
				Dialogic.set_variable("abyss_mask_score", 2)
			if GlobalSettings.score == 3:
				Dialogic.set_variable("cow_score", 3)
				Dialogic.set_variable("abyss_mask_score", 3)
			if GlobalSettings.score == 4:
				Dialogic.set_variable("cow_score", 4)
				Dialogic.set_variable("abyss_mask_score", 4)
			if GlobalSettings.score == 5:
				Dialogic.set_variable("cow_score", 5)
				Dialogic.set_variable("abyss_mask_score", 5)
			if GlobalSettings.score == 6:
				Dialogic.set_variable("cow_score", 6)
			if GlobalSettings.score == 7:
				Dialogic.set_variable("cow_score", 7)
				
