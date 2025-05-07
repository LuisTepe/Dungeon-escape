extends Area2D

@onready var game_manager = %GameManager


func _on_body_entered(body: Node2D) -> void:
	# Add a point to the score
	game_manager.add_point()
	
	# Play coin sound effect
	$coin.play()
	
	# Visually hide the coin
	$AnimatedSprite2D.visible = false
	
	# Wait for sound to play before removing the coin
	await get_tree().create_timer(0.5).timeout
	print("+1 moneda!")
	#Utils.saveGame()
	
	# Remove the coin from the scene
	queue_free()	
