extends Label

onready var mask_score = Dialogic.get_variable("abyss_mask_score")

func _process(delta):
	self.text = str(GlobalSettings.mask_score)
	
func _on_Score_body_entered(body):
		if body.is_in_group("score"):
			GlobalSettings.mask_score += 1
			body.remove_from_group("score")
			
			if GlobalSettings.mask_score == 1:
				Dialogic.set_variable("abyss_mask_score", 1)
			if GlobalSettings.mask_score == 2:
				Dialogic.set_variable("abyss_mask_score", 2)
			if GlobalSettings.mask_score == 3:
				Dialogic.set_variable("abyss_mask_score", 3)
			if GlobalSettings.mask_score == 4:
				Dialogic.set_variable("abyss_mask_score", 4)
			if GlobalSettings.mask_score == 5:
				Dialogic.set_variable("abyss_mask_score", 5)
			if GlobalSettings.mask_score == 6:
				Dialogic.set_variable("abyss_mask_score", 6)
				
