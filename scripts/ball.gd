extends CharacterBody2D

const SPEED = 300.0
var direction = Vector2.ZERO
func _ready(): #picks a random direction for the ball upon opening the scene/game, and sets an intial velocity Vector
	direction.x = [-1, 1].pick_random()
	direction.y = [-1, 1].pick_random()
	velocity = Vector2(direction)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision: #all this does is get what collided with the ball and adjusts it's direction accordingly
		var hitObject = str(collision.get_collider())
		if hitObject.contains("Top") or hitObject.contains("Bottom") == true:
			direction = Vector2(direction.x, -direction.y)
		else:
			direction = Vector2(-direction.x, direction.y)
	else:
		velocity = direction * SPEED
	position += velocity * delta
	print(direction)
