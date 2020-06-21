extends Area2D




var area = Area2D

export var is_toggleable = false

# warning-ignore:unused_argument
func _on_Area2D2_body_entered(body):
	if is_toggleable == true:
		get_node("Light2D").set_enabled(true)
	
	
