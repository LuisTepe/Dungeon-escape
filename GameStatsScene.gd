extends Control

# Automatically gets reference to the container where game stats will be displayed
@onready var stats_container = $VBoxContainer/ScrollContainer/StatsContainer

# Called when the node enters the scene tree
func _ready():
	var config = ConfigFile.new()
	
	# Path to the saved game data file
	var file_path = "user://savegame.cfg"

	# Try to load the saved config file
	var err = config.load(file_path)
	if err != OK:
		print("No se encontro archivo de guardado.")
		return

	print("Archivo de guardado cargado correctamente")
	
	# Loop through all sections in the save file
	for section in config.get_sections():
		
		# Only process sections that represent a game session
		if section.begins_with("game_"):
			
			#load the session time
			var time = config.get_value(section, "time", "Unknown Time")
			
			# Load score or coins from that session
			var coins = config.get_value(section, "score", 0)

			print("Cargando seccion: ", section, " hora: ", time, " y monedas: ", coins)
			
			# Create a new label to display the stats for this session
			var label = Label.new()
			
			#format the text
			label.text = "%s - Monedas: %d" % [time, coins]
			
			# Add the label to the container to show it in UI
			stats_container.add_child(label)

# Triggered when the "Quit" button is pressed
func _on_quit_pressed() -> void:
	#play the cound
	$Click.play()
	# Wait for the sound to finish (0.5s delay)
	await get_tree().create_timer(0.5).timeout
	#change scene to main menu
	get_tree().change_scene_to_file("res://main.tscn")

#triggered when mouse hovered around the button
func _on_quit_mouse_entered() -> void:
	$Hover.play()
