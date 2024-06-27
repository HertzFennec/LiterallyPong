extends CharacterBody2D

const SPEED = 300.0
var direction = Vector2.ZERO
signal tellOpponent(currentPosition)
signal updateScore(scorer)

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
		elif hitObject.contains("Left") == true:
			emit_signal("updateScore", "player")
			queue_free()
		elif hitObject.contains("Right") == true:
			emit_signal("updateScore", "opponent")
			queue_free()
		else:
			direction = Vector2(-direction.x, direction.y)
		velocity = velocity.bounce(collision.get_normal()) #I have no fucking idea how this works but this is what fixed the "jiggling" issue
	else:
		velocity = direction * SPEED
	position += velocity * delta
	emit_signal("tellOpponent", position)
	print(direction)
	
