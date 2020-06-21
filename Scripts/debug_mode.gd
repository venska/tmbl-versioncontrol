extends CanvasLayer

var stats = []


func _ready():
	pass 

func add_stat(stat_name, object, stat_ref, is_method):
	stats.append([stat_name, object, stat_ref, is_method])

# warning-ignore:unused_argument
func _process(delta):
	var label_text = ""
	
	var s_memory = OS.get_static_memory_usage()
	label_text += str("Static Memory: ", String.humanize_size(s_memory))
	label_text += "\n"
	
	var d_memory = OS.get_dynamic_memory_usage()
	label_text += str("Dynamic Memory: ", String.humanize_size(d_memory))
	label_text += "\n"
	
	for s in stats:
		var value = null
		if s[1] and weakref(s[1]).get_ref():
			if s[3]:
				value = s[1].call(s[2])
			else:
				value = s[1].get(s[2])
		label_text += str(s[0], ": ", value)
		label_text += "\n"
		
	$Label.text = label_text
