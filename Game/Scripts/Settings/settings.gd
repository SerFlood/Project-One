extends Control

@onready var menu_scene: Control = $"../Menu"
@onready var settings_scene: Control = $"."
@onready var ambient_one: AudioStreamPlayer2D = $"../../AmbientOne"
@onready var audio_change: Button = $MenuContainer/HBoxContainer/VBoxContainer/Audio/AudioChange
@onready var language_change: Button = $MenuContainer/HBoxContainer/VBoxContainer/Lang/LanguageChange


func _on_back_pressed() -> void:
	menu_scene.show()
	settings_scene.hide()


func _on_audio_change_pressed() -> void:
	if ambient_one.playing:
		ambient_one.stop()
		audio_change.text = "off"
	else:
		ambient_one.play()
		audio_change.text = "on"


func _on_language_change_pressed() -> void:
	if  language_change.text == "eng":
		language_change.text = "rus"
	else:
		language_change.text = "eng"
