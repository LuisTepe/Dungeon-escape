extends CharacterBody2D

#this just plays the idle motion of the character in main menu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("demon 1").play("Idle")
	get_node("demon 2").play("Idle")
	get_node("demon 3").play("Idle")
	get_node("demon 4").play("Idle")
