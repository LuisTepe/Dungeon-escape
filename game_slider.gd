extends HSlider

@export
# The name of the audio bus this slider controls (e.g., "Master", "Music", "SFX")
var bus_name: String

# The index of the audio bus
var bus_index: int

func _ready() -> void:
	# Get the index of the bus using its name
	bus_index = AudioServer.get_bus_index(bus_name)
	
	# Connect the value_changed signal to the custom handler function
	value_changed.connect(_on_value_changed)
	
	# Set the initial slider position based on the current bus volume (converted from decibels to linear)
	value = db_to_linear(
		AudioServer.get_bus_volume_db(bus_index)
	)
	
# Called when the slider's value is changed
func _on_value_changed(value: float) -> void:
	# Set the bus volume to the new value (convert linear value back to decibels)
	AudioServer.set_bus_volume_db(
		bus_index,
		linear_to_db(value)
	)
