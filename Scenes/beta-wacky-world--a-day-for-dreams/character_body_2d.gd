# player.gd
extends CharacterBody2D

# Define the movement speed
var speed = 300

# Function to handle movement
func _physics_process(delta):
	# Get input vector (0,0 if no input, -1,1 for diagonal)
	var input_vector = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		input_vector.y -= 1
	if Input.is_action_pressed("ui_down"):
		input_vector.y += 1
	if Input.is_action_pressed("ui_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("ui_right"):
		input_vector.x += 1

	# Normalize the vector to prevent faster diagonal movement
	if input_vector != Vector2.ZERO:
		input_vector = input_vector.normalized()

	# Calculate the velocity
	velocity = input_vector * speed
	
	# Move and handle collisions
	move_and_slide()
