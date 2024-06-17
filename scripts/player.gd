extends CharacterBody2D
const SPEED = 350.0
@export var friction = 0.2

func _physics_process(delta):
	var direction = get_axis()
	var currentVelocity = get_real_velocity()
	match direction:
		-1, 1: #ok, so apparently OR will cause it to only choose one or the other. use "," instead.
			velocity = Vector2(0, direction * SPEED)
		0:
			velocity = lerp(currentVelocity, Vector2.ZERO, friction)
	position += velocity * delta
	# print(direction)
	move_and_slide()
	
func get_axis(): #function called to get direction based on input
	if Input.is_action_just_pressed("up"):
		return -1
	elif Input.is_action_just_pressed("down"):
		return 1
	else:
		return 0
