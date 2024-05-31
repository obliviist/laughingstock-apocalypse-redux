extends Label

onready var cheat_score = GlobalSettings.get_variable("cheat_score") 

func _process(delta):
	self.text = str(GlobalSettings.cheat_score)
	
func _on_CheatActivated():
		
			$Sfx.stream = load("res://src/sfx/one_shots/Synth-RolandishHi.wav")
			$Sfx.play()
			
			if GlobalSettings.cheat_score == 1:
				Dialogic.set_variable("cheat_score", 0)
			if GlobalSettings.cheat_score == 2:
				Dialogic.set_variable("cheat_score", 1)
			if GlobalSettings.cheat_score == 3:
				Dialogic.set_variable("cheat_score", 2)
			if GlobalSettings.cheat_score == 4:
				Dialogic.set_variable("cheat_score", 3)
		
				
