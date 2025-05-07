class_name Enemy
extends Node2D

# Variables that can be tweaked to change enemies 
const SPEED = 50
var target: Player = null
var direction = 1

# Load in Rays in order to control enemy movement
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_down: RayCast2D = $RayCastDown
@onready var ray_cast_up: RayCast2D = $RayCastUp
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Checks to see if enemy is going to hit a wall to the right
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true # Flips sprite horizontally
		# Checks to see if enemy is going to hit a wall to the left
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false # Flips sprite horizontally
	# Move the enemy
	position.x += direction * SPEED * delta # Moves in direction and speed with the given delta (time between frames)
	
	
