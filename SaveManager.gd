extends Node

# Path where the save file will be stored
var save_path := "user://savegame.cfg"

# Game state variables
var current_level = "res://game.tscn"
var session_count: int = 0
var score = 0
var total_coins_collected = 0
var session_log: Array = []

# Helper function to get formatted date/time
func get_pretty_datetime() -> String:
	var now = Time.get_datetime_dict_from_system()
	var hour = now["hour"]
	var minute = now["minute"]
	var am_pm = "AM"

# Convert 24-hour time to 12-hour format
	if hour >= 12:
		am_pm = "PM"
		if hour > 12:
			hour -= 12
	elif hour == 0:
		hour = 12

	# Always display two digits for minutes
	var minute_str = ("%02d" % minute)
	# List of month names for formatting
	var month_names = ["January", "February", "March", "April", "May", "June",
					   "July", "August", "September", "October", "November", "December"]

	# Construct formatted string
	var formatted = "%d:%s %s %s %d %d" % [
		hour, minute_str, am_pm,
		month_names[now["month"] - 1], now["day"], now["year"]
	]
	return formatted


# Save game data to file
# If is_game_over is true, a new session record is created
func save_game(is_game_over: bool) -> void:
	var config = ConfigFile.new()
	var file_path = save_path

	# Attempt to load existing config file
	var err = config.load(file_path)
	if err == OK:
		if is_game_over:
			# Count existing game sessions to increment session_count
			for section in config.get_sections():
				if section.begins_with("game_"):
					session_count += 1
	else:
		session_count = 0  # Start fresh if file doesn't exist

	# Only save a new session if game is over
	if is_game_over:
		var section_name = "game_%d" % session_count
		config.set_value(section_name, "time", get_pretty_datetime())  # Updated here
		config.set_value(section_name, "current_level", current_level)
		config.set_value(section_name, "score", score)
		config.set_value(section_name, "total_coins_collected", total_coins_collected)
		config.save(file_path)

# Load latest game data
func load_game() -> bool:
	var config = ConfigFile.new()
	var err = config.load(save_path)
	if err == OK:
		current_level = config.get_value("game", "current_level", "res://game.tscn")
		score = config.get_value("game", "score", 0)
		total_coins_collected = config.get_value("game", "total_coins_collected", 0)
		return true
	return false

# Reset game save data
func reset_save():
	var config = ConfigFile.new()
	config.save(save_path)
	current_level = "res://game.tscn"
	score = 0
	total_coins_collected = 0 
