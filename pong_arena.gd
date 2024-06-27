extends Node2D

var ball = preload("res://characterscenes/ball.tscn")

func _on_h_box_container_resetdeez_nuts():
	var newBall = ball.instantiate()
	newBall.position = Vector2(568, 312)
	add_child(newBall)
	
