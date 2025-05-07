extends Control

# Called when the "Confirm" button is pressed
func _on_confirm_pressed() -> void:
	# Set the volume levels of different audio buses using the values from sliders
	#Master volume
	AudioServer.set_bus_volume_db(0, linear_to_db($AudioOptions/VBoxContainer/gameSlider.value))
	#Music volume
	AudioServer.set_bus_volume_db(1, linear_to_db($AudioOptions/VBoxContainer/musicSlider.value))
	#SFX volume - sound effects
	AudioServer.set_bus_volume_db(2, linear_to_db($AudioOptions/VBoxContainer/SFXSlider.value))

#Called when the "Close" button is pressed
func _on_close_pressed() -> void:
	#play click sound
	$Click.play()
	# Wait for the sound to finish (0.5s delay)
	await get_tree().create_timer(0.5).timeout
	#change scene
	get_tree().change_scene_to_file("res://main.tscn")

func _on_close_mouse_entered() -> void:
	#play the sound when mouse hover on button
	$Hover.play()
