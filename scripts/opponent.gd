extends CharacterBody2D


const SPEED = 300.0
@export var friction = 0.2
var ballPosition = Vector2(0, 0)
@export var rate = 100

func _physics_process(delta):
	var direction = get_axis(ballPosition)
	var currentVelocity = get_real_velocity()
	var distance = abs(ballPosition.y - position.y)
	match direction:
		-1, 1: #ok, so apparently OR will cause it to only choose one or the other. use "," instead
			velocity = velocity.move_toward(Vector2(0, distance), rate) * direction
	print(velocity.y)
	position += velocity * delta
	print(direction)
	move_and_slide()

func get_axis(ball_pos):
	if ball_pos.y < position.y:
		return -1
	if ball_pos.y > position.y:
		return 1

func _on_ball_tell_opponent(currentPosition):
	ballPosition = currentPosition
