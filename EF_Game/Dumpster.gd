extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	#print("position: ",position.z)
	if(position.z >= 0 and $"../value_handler".get_game_state() == false):
		$"../value_handler".set_game_state(true)
		print("Game ended by position: ",$"../value_handler".get_game_state())

func _on_hit_detect_body_entered(body):
	#Check if collides with a body
	
	
	if body.has_meta("Collect"):
		print("+1 Collectable")
		$"../value_handler".add_coins(1)
		body.queue_free()
	else:
		#If it collides, and the body has the Metadata bool "Obstacle" set to true
		#To add the metadata to an object, go to the bottom of the obstacle in the inspector window, click Add Metadata, and create a bool named Obstacle and set it to true
		print("collided, end the game")
		#PUT END GAME CODE HERE AND REMOVE PASS
		print("Total Coins: ",$"../value_handler".get_coins())
		print("Distance: ",$"../value_handler".get_distance())
		print("Time: ",$"../value_handler".get_time())
		
		$"../value_handler".set_game_state(true)
		print("Game ended by collision: ",$"../value_handler".get_game_state())
	
