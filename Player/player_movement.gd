extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Movement
	var direction := Input.get_vector("moveLeft", "moveRight", "moveUp", "moveDown")
	if direction:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	# Look dir
	look_at(get_global_mouse_position())
	move_and_slide()
