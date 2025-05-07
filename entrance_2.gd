extends Area2D

# Detects when the player exits Level 2 and moves to level 3 which is boss level
func _on_body_entered(body):
	print("enterance touched")
	get_tree().change_scene_to_file("res://game_1.tscn")
