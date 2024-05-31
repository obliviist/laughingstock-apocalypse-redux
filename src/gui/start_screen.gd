extends CanvasLayer

export(String, FILE) var level

onready var start_btn = $MainMenu/MarginContainer/VBoxContainer/StartBtn
onready var howtoplay_menu = $HowToPlayPopup
onready var controls_menu = $ControlsPopup
onready var cheathelp_popup = $CheatHelpPopup
onready var settings_menu = $SettingsMenu

func _ready():
	start_btn.grab_focus()
	get_tree().paused = false
	Music.stream = load("res://src/music/arp one_loop.wav") 
	Music.play()

func _on_StartBtn_pressed():
	Sfx.stream = load("res://src/sfx/one_shots/Synth-RolandishLo.wav")
	Sfx.play()
	Music.stop()
	get_tree().change_scene("res://src/gui/world_1_slide.tscn")
	
func _on_HowToPlayBtn_pressed():
	Sfx.stream = load("res://src/sfx/one_shots/Synth-RolandishHi.wav")
	Sfx.play()
	howtoplay_menu.popup_centered()
	
func _on_ControlsBtn_pressed():
	Sfx.stream = load("res://src/sfx/one_shots/Synth-RolandishHi.wav")
	Sfx.play()
	controls_menu.popup_centered()
	
func _on_SettingsBtn_pressed():
	Sfx.stream = load("res://src/sfx/one_shots/Synth-RolandishHi.wav")
	Sfx.play()
	settings_menu.popup_centered()
	
func _on_QuitBtn_pressed():
	get_tree().quit()

func _on_TheUrnListener_cheat_activated():
	get_tree().change_scene("res://levels/world_urn.tscn")
	#get_tree().change_scene("res://src/gui/world_urn_slide.tscn")

func _on_TheAbyssListener_cheat_activated():
	get_tree().change_scene("res://levels/world_abyss.tscn")
	#get_tree().change_scene("res://src/gui/world_abyss_slide.tscn")

func _on_TheKeepListener_cheat_activated():
	get_tree().change_scene("res://levels/world_keep.tscn")
	#get_tree().change_scene("res://src/gui/world_keep_slide.tscn")

func _on_TheSaloonListener_cheat_activated():
	get_tree().change_scene("res://levels/world_saloon.tscn")
	#get_tree().change_scene("res://src/gui/world_saloon_slide.tscn")

func _on_HelpListener_cheat_activated():
	Sfx.stream = load("res://src/sfx/one_shots/Synth-RolandishHi.wav")
	Sfx.play()
	cheathelp_popup.popup_centered()

