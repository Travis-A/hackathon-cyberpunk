extends CharacterBody2D

@export var health : Health
@export var speed = 200.0


func _physics_process(delta: float) -> void:
	# Movement
	var direction := Input.get_vector("moveLeft", "moveRight", "moveUp", "moveDown")
	if direction and health.is_alive:
		velocity = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
	
	# Look dir
	look_at(get_global_mouse_position())
	move_and_slide()
