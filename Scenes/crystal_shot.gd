extends Area2D


const speed = 350
var velocity = Vector2()
var direction = 1

func set_crystalshot_direction(dir):
	direction = dir
	if dir == -1:
		rotation_degrees = -180
	
	

	
	
	
func _on_crystal_shot_body_entered(body):
	if "Stalker" in body.name:
		body.dead()
#	queue_free()

func _physics_process(delta):
	velocity.x = speed * delta * direction
	translate(velocity)
	$Timer.start()
#	print($Particles2D.process_material.get_direction())
	


func _on_Timer_timeout():
	queue_free()
