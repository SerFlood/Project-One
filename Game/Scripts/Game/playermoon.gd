extends Node2D

var rotation_speed = 125.0
var rotation_direction = 1.0
var distance_from_center = 45.0

@onready var center_planet = get_node("../CenterPlanet")
@onready var guide: Control = $"../CanvasLayer/Guide"

var current_angle = 0.0


func _process(delta: float):
	current_angle += rotation_speed * rotation_direction * delta

	var angle_in_radians = deg_to_rad(current_angle)

	position.x = center_planet.position.x + distance_from_center * cos(angle_in_radians)
	position.y = center_planet.position.y + distance_from_center * sin(angle_in_radians)


func _input(event):
	if Global.save_dict["game_entries"] == 1:
		guide.show()
		if event.is_action_pressed("orbite_move"):
			guide.hide()
			Global.save_dict["game_entries"] += 1
	else:
		guide.hide()

	if event.is_action_pressed("orbite_move"):
		change_direction()


func change_direction():
	rotation_direction *= -1
