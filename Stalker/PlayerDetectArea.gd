extends Area2D


var player = null


func can_see_player():
	return player != null

func _on_PlayerDetectArea_body_entered(body):
	if "Player" in body.name:
		player = body


func _on_PlayerDetectArea_body_exited(body):
	if "Player" in body.name:
		player = null



	
