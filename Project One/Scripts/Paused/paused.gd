extends Control

@onready var paused_scene: Control = $"."


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("paused"):
		get_tree().paused = true
		paused_scene.show()


func _on_continue_pressed() -> void:
	paused_scene.hide()
	get_tree().paused = false


func _on_menu_pressed() -> void:
	get_tree().reload_current_scene()
