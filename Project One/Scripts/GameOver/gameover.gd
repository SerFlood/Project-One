extends Control

@onready var gameover_scen = $"."


func show_gameover() -> void:
	gameover_scen.show()
	get_tree().paused = true


func _on_restart_pressed() -> void:
	gameover_scen.hide()
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_quit_pressed() -> void:
	get_tree().quit()
