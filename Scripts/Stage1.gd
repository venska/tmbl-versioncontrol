extends Node2D



func _ready():
	var debug_overlay = load("res://Scenes./debug_mode.tscn").instance()
	debug_overlay.add_stat("Player Pos", $Player, "position", false)
	debug_overlay.add_stat("Velocity", $Player, "velocity", false)
	debug_overlay.add_stat("Cursor Pos", $Player, "cursor_pos", false)
	debug_overlay.add_stat("FPS", Engine, "get_frames_per_second", true)
	
# warning-ignore:unused_variable
	var game_version = load("res://Scenes./game_ver.tscn").instance()
	
	
	
	add_child(debug_overlay)


