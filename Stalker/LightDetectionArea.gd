extends Area2D

var player_nearlight = 0

func _on_LightDetectionArea_area_entered(area):
	if "Torch" in area.name:
		print("cant reach that homoie")
		player_nearlight = 1
	


func _on_LightDetectionArea_area_exited(area):
	if "Torch" in area.name:
		print("IMMMA GET YA BOI")
		player_nearlight = 0
