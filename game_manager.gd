extends Node


@onready var score_label: Label = $CanvasLayer/ScoreLabel

var score = 0

# Flag to track if the game is active
var game_active = true


func _ready():
	# Load score from SaveManager if present
	score = SaveManager.score
	score_label.text = "Monedas: " + str(score)
	
# Function to add points when a coin is collected
func add_point():
	if game_active:  # Only allow point collection if the game is active
		score += 1
		score_label.text = "Monedas: " + str(score)

		SaveManager.score = score  # Update SaveManager's score
		SaveManager.total_coins_collected = score  # Update total coins collected in SaveManager
		print(score)

# Handle game quitting
func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		SaveManager.current_level = get_tree().current_scene.scene_file_path
		SaveManager.save_game(true)  # Save game when the window is closed and game is ending
