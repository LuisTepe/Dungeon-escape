extends CharacterBody2D

# Player character script controlling movement, animation, and sound
class_name Player

# --- Node references ---
@onready var walking: AudioStreamPlayer = $walking           # Footstep sound
@onready var footsteps: Timer = $footsteps                   # Timer controlling footstep intervals

# --- Movement constants ---
const SPEED = 100.0                                           # Movement speed

# --- State flags ---
var movement_locked = false                                  # Prevent movement (e.g., during death animation)
var animation_locked = false                                 # Prevent animation changes (e.g., when a custom anim is playing)
var animation_lock_timer = 0.0                               # Timer controlling animation lock duration

func _ready():
	# Connect the timeout signal of the footsteps timer
	footsteps.timeout.connect(_on_footsteps_timeout)
	
	# Start footstep sound initially
	walking.play()

# --- Physics update function ---
func _physics_process(delta):
	# Handle animation lock timing
	if animation_locked:
		animation_lock_timer -= delta
		if animation_lock_timer <= 0:
			animation_locked = false
			movement_locked = false

	# Prevent movement if locked
	if movement_locked:
		velocity = Vector2.ZERO
		_stop_footsteps()
	else:
		var input_vector = Vector2(
			Input.get_axis("move_left", "move_right"),
			Input.get_axis("move_up", "move_down")
		).normalized()
		
		# Move and animate based on input
		if input_vector != Vector2.ZERO:
			velocity = input_vector * SPEED
			
			# Flip sprite based on horizontal movement direction
			if input_vector.x != 0:
				$AnimatedSprite2D.flip_h = input_vector.x < 0

			$AnimatedSprite2D.play("run")
			_start_footsteps()
		else:
			velocity = Vector2.ZERO
			$AnimatedSprite2D.play("idle")
			_stop_footsteps()
	# Apply movement
	move_and_slide()

# --- Start the footstep sound and timer if not already running ---
func _start_footsteps():
	if footsteps.is_stopped():
		walking.play()
		footsteps.start()

# --- Stop the footstep sound and timer ---
func _stop_footsteps():
	if footsteps and not footsteps.is_stopped():
		footsteps.stop()
	if walking:
		walking.stop()
		

# --- Callback: Play footstep sound on timer timeout ---
func _on_footsteps_timeout() -> void:
	walking.play()


# --- Play an animation and lock movement and animation temporarily ---
# @param anim_name The name of the animation to play
# @param duration How long to lock the animation and movement (default 1.0 sec)
func play_animation(anim_name: String, duration: float = 1.0):
	print("Locking and playing:", anim_name)
	$AnimatedSprite2D.play(anim_name)
	animation_locked = true
	movement_locked = true
	animation_lock_timer = duration
