extends Control

@onready var menu_scene = $"."
@onready var settings_scene: Control = $"../Settings"


func _ready() -> void:
	get_tree().paused = true


func _on_play_pressed() -> void:
	menu_scene.hide()
	get_tree().paused = false


func _on_settings_pressed() -> void:
	settings_scene.show()
	menu_scene.hide()


func _on_quit_pressed() -> void:
	get_tree().quit()
