extends CharacterBody2D


const SPEED = 300.0
var direction = Vector2.ZERO
func _ready():
	direction.x = [-1, 1].pick_random()
	direction.y = [-1, 1].pick_random()
	velocity = Vector2(direction)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		direction = Vector2(-direction.x, -direction.y)
	else:
		velocity = direction * SPEED
	position += velocity * delta
	print(direction)
