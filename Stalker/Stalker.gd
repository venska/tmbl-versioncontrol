extends KinematicBody2D


enum {
	idle,
	wander,
	pursuit,
	scared
}
var velocity = Vector2.ZERO
var state = pursuit
onready var player_detect_zone = $PlayerDetectArea
onready var player_detect_light = $LightDetectionArea
var acceleration =  450
var max_speed = 200
var friction =  200
var is_dead = false
export(Vector2) var size = Vector2(1, 1)
export var ai_enable = true

func _ready():
	scale = size
	pass

func dead():
	is_dead = true
	velocity = Vector2(0, 0)
	$CollisionShape2D.disabled = true
	$Timer.start()
	


# warning-ignore:unused_argument
func _physics_process(delta):
	if is_dead == false:
		if ai_enable == true:
			match state:
				idle:
					velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
					detect_player()
				wander:
					pass
					
				pursuit:
					var player = player_detect_zone.player
					var player_light = player_detect_light.player_nearlight
					if player != null:
						var direction = (player.global_position - global_position).normalized()
						velocity = velocity.move_toward(direction * max_speed, acceleration * delta)
					if player == null:
						state = idle
					if player_light == 1:
						state = scared
					if player_light == 0:
						state = idle
				scared:
					velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
				
		velocity = move_and_slide(velocity)
	
func detect_player():
		if player_detect_zone.can_see_player():
			state = pursuit


func _on_Timer_timeout():
	get_parent().get_node("Screenshake").screen_shake(0.50, 3.5, 100)
	queue_free()



