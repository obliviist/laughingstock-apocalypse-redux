extends AudioStreamPlayer


func _ready():
	GlobalSettings.connect("master_updated", self, "_on_master_updated")
	GlobalSettings.connect("music_updated", self, "_on_music_updated")
	GlobalSettings.connect("sfx_updated", self, "_on_sfx_updated")
	GlobalSettings.connect("amb_updated", self, "_on_amb_updated")

func _on_master_updated(vol):
	Music.volume_db = vol
	Sfx.volume_db = vol
	Amb.volume_db = vol
	
func _on_music_updated(vol):
	Music.volume_db = vol
	
func _on_sfx_updated(vol):
	Sfx.volume_db = vol

func _on_amb_updated(vol):
	Amb.volume_db = vol
