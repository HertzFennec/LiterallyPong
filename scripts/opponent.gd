extends CharacterBody2D


const SPEED = 300.0
@export var friction = 0.2
var ballPosition = Vector2(0, 0)
@export var rate = 2000
var startPosX = 40
var startPosY = 272

func _physics_process(delta):
	var direction = get_axis(ballPosition)
	var distanceX = abs(ballPosition.x - position.x)
	var distanceY = abs(ballPosition.y - position.y)
	var currentVelocity = get_real_velocity()
	if distanceX < 400:
		match direction:
			-1, 1: #ok, so apparently OR will cause it to only choose one or the other. use "," instead
				velocity = velocity.move_toward(Vector2(0, distanceY), rate) * direction
			0:
				velocity = lerp(currentVelocity, Vector2.ZERO, friction)
	else:
		position = Vector2(startPosX, startPosY)
	print(velocity.y)
	position += velocity * delta
	print(direction)
	move_and_slide()

func get_axis(ball_pos):
	if ball_pos.y < position.y:
		return -1
	if ball_pos.y > position.y:
		return 1
	else:
		return 0

func _on_ball_tell_opponent(currentPosition):
	ballPosition = currentPosition

