extends Node

signal updated

signal fps_displayed(value)
signal bloom_toggled(value)
signal brightness_updated(value)
signal fov_updated(value)
signal mouse_sens_updated(value)

#goldenboi
signal playerRefSet(ref)

var score = 0 setget set_score

#goldenboi
var playerRef : KinematicBody = null setget setPlayerRef, getPlayerRef
var cameraRef : Camera = null setget setCameraRef, getCameraRef

func setPlayerRef(player : KinematicBody):
	if player.is_in_group("Player"):
		playerRef = player
		emit_signal("playerRefSet", player)
		
func getPlayerRef():
	return playerRef
	
func setCameraRef(camera : Camera):
	cameraRef = camera
	
func getCameraRef():
	return cameraRef
# / goldenboi

func reset():
	self.score = 0
	
func set_score(new_score: int) -> void:
	score = new_score
	emit_signal("updated")

func toggle_fullscreen(value):
	OS.window_fullscreen = value
	Save.game_data.fullscreen_on = value
	Save.save_data()
	
	
func toggle_vsync(value):
	OS.vsync_enabled = value
	Save.game_data.vsync_on = value
	Save.save_data()
	
	
func toggle_fps_display(value):
	emit_signal("fps_displayed", value)
	Save.game_data.display_fps = value
	Save.save_data()
	
func set_max_fps(value):
	Engine.target_fps = value if value < 500 else 0
	Save.game_data.max_fps = Engine.target_fps if value < 500 else 500
	Save.save_data()


func toggle_bloom(value):
	emit_signal("bloom_toggled", value)
	Save.game_data.bloom_on = value
	Save.save_data()


func update_brightness(value):
	emit_signal("brightness_updated", value)
	Save.game_data.brightness = value
	Save.save_data()
	
func update_master_vol(vol):
	AudioServer.set_bus_volume_db(0, vol)
	Save.game_data.master_vol = vol
	Save.save_data()
	
func update_music_vol(vol):
	AudioServer.set_bus_volume_db(1, vol)
	Save.game_data.music_vol = vol
	Save.save_data()

func update_sfx_vol(vol):
	AudioServer.set_bus_volume_db(2, vol)
	Save.game_data.sfx_vol = vol
	Save.save_data()

func update_amb_vol(vol):
	AudioServer.set_bus_volume_db(3, vol)
	Save.game_data.amb_vol = vol
	Save.save_data()
	
func update_fov(value):
	emit_signal("fov_updated", value)
	Save.game_data.fov = value
	Save.save_data()
	
func update_mouse_sens(value):
	emit_signal("mouse_sens_updated", value)
	Save.game_data.mouse_sens = value
	Save.save_data()
	

