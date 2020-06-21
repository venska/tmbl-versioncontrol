extends KinematicBody2D

##TEST WIDTH = 960
## TEST HEIGHT = 540

const stop = 0
const gravity = 10
const jump_height = -275
const ground = Vector2(0, -1)
const dash_speed = 250
const crystal_shot = preload("res://Scenes./crystal_shot.tscn")
const crystal_trail = preload("res://Scenes./Trail.tscn")

var on_ground = false
var speed = 150
var velocity = Vector2()
var dash_time = 10
var dashing = false
var max_dash_time = 1
var jump_count = 0
var test = 1
var equipped_sphere = null
var cursor_pos = get_local_mouse_position()
var crystal_value = 0
var can_dash = 0
var dash_direction = Vector2()
var crystal_dash_value = 0
var is_dashing = 0

signal shot_crystal



# warning-ignore:unused_argument
func _physics_process(delta):
	
	
	add_to_group("Player")
	
	############# MOVEMENT ################
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		$AnimatedSprite.flip_h = false
		if sign($Position2D.position.x) == -1:
			$Position2D.position.x *= -1
		
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		$AnimatedSprite.flip_h = true
		if sign($Position2D.position.x) == 1:
			$Position2D.position.x *= -1
	else:
		velocity.x = 0
	if Input.is_action_just_pressed("ui_up"):
#		if on_ground == true:
#			velocity.y = jump_height
#			on_ground == false
	
			################################ DOUBLE JUMP#######################
			if jump_count < 1:
				jump_count += 1
				velocity.y = jump_height
				on_ground = false
				
	if Input.is_action_just_pressed("ui_right"):
			dash_direction = Vector2(1, 0)
	if Input.is_action_just_pressed("ui_left"):
			dash_direction = Vector2(-1, 0)
			
	if Input.is_action_just_pressed("dash_left"):
		if crystal_dash_value > 0:
			velocity.x = -velocity.x * -50
			if not velocity.x == 0:
				get_parent().get_node("Screenshake").screen_shake(1, 2.5, 100)
				crystal_dash_value -= 1
				is_dashing = 1
				
	if Input.is_action_just_pressed("dash_right"):
		if crystal_dash_value > 0:
			velocity.x = velocity.x * 50
			if not velocity.x == 0:
				get_parent().get_node("Screenshake").screen_shake(1, 2.5, 100)
				crystal_dash_value -= 1
				is_dashing = 1
		
	if is_on_floor():
		if on_ground == false:
			on_ground == true
			jump_count = 0
			can_dash = 1
	else:
		if on_ground == true:
			on_ground == false
			jump_count = 2
			can_dash = 0
	
	if Input.is_action_just_pressed("ui_select"):
		if crystal_value == 1:
			get_parent().get_node("Screenshake").screen_shake(1.25, 15, 100)
			var crystalshot = crystal_shot.instance()
			if sign($Position2D.position.x) == 1:
				crystalshot.set_crystalshot_direction(1)
				crystal_value = 0
				
				
			else:
				crystalshot.set_crystalshot_direction(-1)
				crystal_value = 0
				
			get_parent().add_child(crystalshot)
			crystalshot.position = $Position2D.global_position
#			
		if crystal_value == 0:
			var collecting = 1
			
	########### GRAAVITY
	
	velocity.y += gravity
	velocity = move_and_slide(velocity, ground)
#func _process(delta):
#	var crystaltrail = crystal_trail.instance()
#	crystaltrail.point =  crystaltrail.targetpath
#	cursor_pos = get_local_mouse_position()
	

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_ESCAPE:
# warning-ignore:return_value_discarded
			get_tree().change_scene("res://Titlescreen.tscn")
			#if you press escape you're a goner basically
	if event is InputEventMouseButton and event.is_pressed():
		print("bb")
		position = cursor_pos
	

#func dash():
	
	
	
		
func crystal_collected():
	crystal_value = 1
	crystal_dash_value = 5



func _on_ghost_timer_timeout():
	if is_dashing == 1:
		var this_ghost = preload("res://Scenes./ghosteffect.tscn").instance();
		get_parent().add_child(this_ghost)
		this_ghost.position = position
		this_ghost.texture = $AnimatedSprite.frames.get_frame($AnimatedSprite.animation, $AnimatedSprite.frame)
		this_ghost.flip_h = $AnimatedSprite.flip_h
		this_ghost.scale = $AnimatedSprite.scale
