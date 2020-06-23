extends Area2D

var ouchie = 0



	
	



	

# warning-ignore:unused_argument
func _process(delta):
	pass







func _on_PLAYERDEATHER_area_entered(area):
	if "Spikes" in area.name:
		get_parent().dead()
