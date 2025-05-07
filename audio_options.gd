# This script is attached to a UI Control node.
extends Control

#the buses are connected to their respctive audio files so the slider knows which its connected to

# Called when the node enters the scene tree for the first time.
func _ready():
# Set the value of the game volume slider based on the current bus volume (converted from decibels to linear)
	$VBoxContainer/gameSlider.value = db_to_linear(AudioServer.get_bus_volume_db(0))
	$VBoxContainer/musicSlider.value = db_to_linear(AudioServer.get_bus_volume_db(1))
	$VBoxContainer/SFXSlider.value = db_to_linear(AudioServer.get_bus_volume_db(2))

#when the mouse exists the volume slider it removes focus from the buses
func _on_h_slider_3_mouse_exited() -> void:
	release_focus()

func _on_h_slider_2_mouse_exited() -> void:
	release_focus()

func _on_h_slider_mouse_exited() -> void:
	release_focus()
