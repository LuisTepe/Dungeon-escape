# This script controls the Pause Menu UI
extends Control

# Called when the node enters the scene tree for the first time
func _ready():
	# Hide the pause menu initially
	hide()
	print("Pause Menu Position: ", position)
	# Reset animation to blur
	$AnimationPlayer.play("RESET")

# Resume the game from pause when button clicked
func resume():
	# Unpause the game
	get_tree().paused = false
	# Hide the pause menu
	hide()
	# Play blur animation in reverse
	$AnimationPlayer.play_backwards("blur")

# Pause the game and show the menu when esc key pressed
func pause():
	# Pause the game
	get_tree().paused = true
	show() # Show the pause menu when paused
	$AnimationPlayer.play("blur") # Blur the Background

# Check if Escape key is pressed and toggle pause/resume
func testEsc():
	if Input.is_action_just_pressed("esc") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused == true:
		resume()

# Called when "Resume" button is pressed
func _on_resume_pressed():
	# Play click sound
	$Click.play()
	# Wait for the sound to finish (0.5s delay)
	await get_tree().create_timer(0.5).timeout
	# Resume game
	resume()

# Called when "Restart" button is pressed
func _on_restart_pressed():
	$Click.play()
	# Restet score
	SaveManager.score = 0
	# Reset coins which is score
	SaveManager.total_coins_collected = 0
	await get_tree().create_timer(0.5).timeout
	resume()
	get_tree().change_scene_to_file("res://game.tscn")  # Change to your game scene path

# Called when "Quit" button is pressed
func _on_quit_pressed():
	# Play click sound
	$Click.play()
	# Wait for the sound to finish (0.5s delay)
	await get_tree().create_timer(0.5).timeout
	
	# Unpause and reset time scale so the new scene works correctly
	get_tree().paused = false
	Engine.time_scale = 1
	
	# Save the session data before quitting
	SaveManager.session_log.append({
		"time": Time.get_datetime_string_from_system(),
		"coins_collected": SaveManager.score
	})
	SaveManager.save_game(true)  # Save session with `true` indicating game over
	# Go to stats scene
	get_tree().change_scene_to_file("res://GameStatsScene.tscn")

# Called every frame to check input
func _process(delta):
	testEsc()

# Play hover sound on buttons
func _on_resume_mouse_entered() -> void:
	$Hover.play()

# Play hover sound on buttons
func _on_restart_mouse_entered() -> void:
	$Hover.play()

# Play hover sound on buttons
func _on_quit_mouse_entered() -> void:
	$Hover.play()
