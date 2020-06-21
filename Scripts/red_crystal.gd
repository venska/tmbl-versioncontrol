extends Area2D


var area = Area2D
var collecting = 0

func _on_red_crystal_body_entered(body):
	if "Player" in body.name:
		
			body.crystal_collected()
			queue_free()
	

func _process(delta):
	print(collecting)
