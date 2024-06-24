extends HBoxContainer

@onready var Player = $PlayerScore
@onready var Opponent = $OpponentScore
var PlayerScore = 0
var OpponentScore = 0
signal resetdeezNuts() #resetting script I just gave it a funny name
func _on_ball_update_score(scorer):
	match scorer:
		"player":
			PlayerScore += 1
			Player.text = str(PlayerScore)
		"opponent":
			OpponentScore += 1
			Opponent.text = str(OpponentScore)
	emit_signal("resetdeezNuts")
