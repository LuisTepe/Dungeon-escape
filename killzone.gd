extends Area2D

@onready var timer: Timer = $Timer
# adds Rays to an array to be checked every frame
@onready var rays: Array = [
	$Ray1, $Ray2, $Ray3, $Ray4, $Ray5, $Ray6, $Ray7, $Ray8, $Ray9, $Ray10,
	$Ray11, $Ray12, $Ray13, $Ray14, $Ray15, $Ray16, $Ray17, $Ray18, $Ray19, $Ray20,
	$Ray21, $Ray22, $Ray23, $Ray24, $Ray25, $Ray26, $Ray27, $Ray28, $Ray29, $Ray30,
	$Ray31, $Ray32, $Ray33, $Ray34, $Ray35, $Ray36
]  # Array of RayCast2D nodes

var player_hit: bool = false  # Flag to track if the player has already been hit
var initial_coin_count: int = 0

func _ready():
	initial_coin_count = SaveManager.score

func _process(delta: float):
	if not player_hit:  # Only check for collisions if player hasn't been hit yet
		for ray in rays:
			if ray.is_colliding():
				var collider = ray.get_collider()
				if collider is Player:
					print("Player hit by ray!")
					collider.play_animation("death") # Plays Character death animation
					$GameOver.play() # Plays death music
					Engine.time_scale = 0.5 # Slows Time Down
					timer.wait_time = 1.0
					timer.start()
					player_hit = true  # Set the flag to true to prevent future triggers
					break  # Exit the loop once a collision is detected

func _on_timer_timeout() -> void:
	# Save this session before resetting
	SaveManager.session_log.append({
		"time": Time.get_datetime_string_from_system(),
		"coins_collected": SaveManager.score
	})
	SaveManager.save_game(true)  # Save session with `true` indicating game over
	#Restore coin count before reloading
	SaveManager.score = initial_coin_count
	get_tree().reload_current_scene()  # Reload the current level
	Engine.time_scale = 1
	player_hit = false
