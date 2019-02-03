extends KinematicBody2D

const UP          = Vector2(0, -1)
const GRAVITY     = 20
const SPEED       = 200
const JUMP_HEIGHT = -500
var motion        = Vector2()

func _physics_process(delta):
	
	# gravity
	motion.y += GRAVITY
	
	# lateral motion
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	else:
		motion.x = 0
	
	# jumping
	if is_on_floor() && Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
	
	motion = move_and_slide(motion, UP)
	
	pass