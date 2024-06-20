extends CharacterBody2D


const SPEED = 300.0
@export var friction = 0.2
var ballPosition = Vector2(568, 312)
@export var rate = 50

func _physics_process(delta):
	var direction = get_axis(ballPosition)
	var currentVelocity = get_real_velocity()
	match direction:
		-1, 1: #ok, so apparently OR will cause it to only choose one or the other. use "," instead.
			velocity.y = velocity.move_toward(ballPosition, rate).y
		0:
			velocity.y = lerp(currentVelocity, Vector2.ZERO, friction)
	position += velocity * delta
	print(ballPosition)
	print(position)
	move_and_slide()

func get_axis(ball_pos):
	if ball_pos < position:
		return -1
	if ball_pos > position:
		return 1
	else:
		return 0

func _on_ball_tell_opponent(currentPosition):
	ballPosition = currentPosition
