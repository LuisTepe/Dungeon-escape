extends CharacterBody2D

#this just plays the idle motion of the character in main menu

func _ready() -> void:
	get_node("Zombie 1").play("Idle")
	get_node("Zombie 2").play("Idle")
	get_node("Zombie 3").play("Idle")
