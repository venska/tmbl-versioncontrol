extends Line2D

var target
var point 
export(NodePath) var targetpath

func _ready():
	target = get_node(targetpath)

func _process(delta):
	
	global_rotation = 0
	point = target.global_position 
	add_point(point)
