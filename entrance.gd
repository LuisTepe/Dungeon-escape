extends Area2D

# Detects when the player exits Level 1 and moves on to level 2
func _on_body_entered(body):
	print("enterance touched")
	get_tree().change_scene_to_file("res://game_2.tscn")
