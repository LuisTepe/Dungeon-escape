extends Node2D

#all these codes are for the buttons to funciton with the sound attached to it
# there is a sound when mouse hovers over the button and once the button is clicked
#each button has it own function to switch to there respective scenes

func _on_quit_pressed() -> void:
	#play the sound when mouse clicked
	$Click.play()
	#Wait for the sound to finish (0.5s delay)
	await get_tree().create_timer(0.5).timeout
	#quit scene
	get_tree().quit()
	
func _on_play_pressed() -> void:
	#play the sound when mouse clicked
	$Click.play()
	#Wait for the sound to finish (0.5s delay)
	await get_tree().create_timer(0.5).timeout
	#change scene
	get_tree().change_scene_to_file("res://game.tscn")

func _on_option_pressed() -> void:
	#play the sound when mouse clicked
	$Click.play()
	#Wait for the sound to finish (0.5s delay)
	await get_tree().create_timer(0.5).timeout
	#change scene
	get_tree().change_scene_to_file("res://options_main.tscn")
	
	
func _on_play_mouse_entered() -> void:
	#play the sound when mouse hover on button
	$Hover.play()
	
func _on_option_mouse_entered() -> void:
	#play the sound when mouse hover on button
	$Hover.play()

func _on_quit_mouse_entered() -> void:
	#play the sound when mouse hover on button
	$Hover.play()


func _on_about_game_pressed() -> void:
	#play the sound when mouse clicked
	$Click.play()
	#Wait for the sound to finish (0.5s delay)
	await get_tree().create_timer(0.5).timeout
	#change scene
	get_tree().change_scene_to_file("res://about_game.tscn")


func _on_about_game_mouse_entered() -> void:
	#play the sound when mouse hover on button
	$Hover.play()
