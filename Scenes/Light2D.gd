extends Light2D

var cursor_pos
var current_pos = get_position()

func _process(delta):
	cursor_pos = get_local_mouse_position()
	position += cursor_pos
