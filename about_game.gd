extends Node2D

#all these codes are for the buttons to funciton with the sound attached to it
# there is a sound when mouse hovers over the button and once the button is clicked
#each button has it own function to switch to there respective scenes

func _on_start_game_pressed() -> void:
	#play the sound when mouse clicked
	$Click.play()
	# Wait for the sound to finish (0.5s delay)
	await get_tree().create_timer(0.5).timeout
	#change scene
	get_tree().change_scene_to_file("res://game.tscn")

func _on_start_game_mouse_entered() -> void:
	#play the sound when mouse hover on button
	$Hover.play()

func _on_options_pressed() -> void:
	#play the sound when mouse clicked
	$Click.play()
	# Wait for the sound to finish (0.5s delay)
	await get_tree().create_timer(0.5).timeout
	#change scene
	get_tree().change_scene_to_file("res://options_main.tscn")

func _on_options_mouse_entered() -> void:
	#play the sound when mouse hover on button
	$Hover.play()

func _on_back_pressed() -> void:
	#play the sound when mouse clicked
	$Click.play()
	# Wait for the sound to finish (0.5s delay)
	await get_tree().create_timer(0.5).timeout
	#change scene
	get_tree().change_scene_to_file("res://main.tscn")

func _on_back_mouse_entered() -> void:
	#play the sound when mouse hover on button
	$Hover.play()
