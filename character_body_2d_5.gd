extends CharacterBody2D

#this just plays the idle motion of the character in main menu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("Skeleton").play("Idle")
