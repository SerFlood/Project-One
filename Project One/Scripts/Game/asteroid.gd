extends Node2D

var speed = 40.0
var center_planet_path = "../CenterPlanet"
var player_moon_path = "../PlayerMoon"
var asteroid_scene_path = "res://Game/Asteroid/Asteroid.tscn"
var spawn_radius = 300.0

@onready var center_planet = get_node(center_planet_path)
@onready var player_moon = get_node(player_moon_path)
@onready var animation_dead = $Asteroid/Dead
@onready var animation_flame = $Asteroid/Flame
@onready var asteroid_sprite = $Asteroid/Sprite2D
@onready var asteroid_light = $Asteroid/PointLight2D
@onready var collision_shape = $Asteroid/CollisionShape2D
@onready var collision_asteroid_sound = $CollisionAsteroid
@onready var gameover_scene = get_node("../CanvasLayer/GameOver")


func _process(delta: float):
	var direction = (center_planet.position - position).normalized()
	position += direction * speed * delta
	
	if position.distance_to(player_moon.position) < 22:
		collision_asteroid_sound.play()
		player_collision()
	if position.distance_to(center_planet.position) < 31:
		collision_asteroid_sound.play()
		planet_collision()


func player_collision():
	if collision_shape and is_instance_valid(collision_shape):
		collision_shape.queue_free()
		collision_shape = null
	
	speed = -2
	animation_flame.visible = false
	asteroid_sprite.visible = false
	asteroid_light.visible = false
	
	animation_dead.play("Dead")
	player_moon.change_direction()
	await animation_dead.animation_finished
	
	queue_free()


func planet_collision():
	if collision_shape and is_instance_valid(collision_shape):
		collision_shape.queue_free()
		collision_shape = null
	
	speed = -2
	animation_flame.visible = false
	asteroid_sprite.visible = false
	asteroid_light.visible = false
	
	animation_dead.play("Dead")
	await animation_dead.animation_finished
	
	queue_free()
	
	gameover_scene.show_gameover()
