extends Area2D


# Detects when the player exits Level 2 and moves on to the finish
func _on_body_entered(body):
	get_tree().change_scene_to_file("res://finish.tscn")
