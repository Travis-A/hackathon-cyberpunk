extends CharacterBody2D


@export var logic : EnemyLogic
@export var speed : float = 100
@export var stop_distance: float = 20

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


var target : CharacterBody2D

signal died

func _physics_process(delta: float) -> void:
	if logic.health.is_alive:
		if target:
			look_at(target.global_position)
			move()
		elif logic.target:
			target = logic.target
	else:
		velocity = Vector2.ZERO
		sprite.play("death")
	move_and_slide()

func move() :
	var distance = global_position.distance_to(target.global_position)

	# Move only if further than stop_distance
	if distance > stop_distance:
		# Get direction vector
		var direction = global_position.direction_to(target.global_position)
		velocity = direction * speed
		sprite.play("idle")
	else:
		# Stop moving if close enough
		velocity = Vector2.ZERO
		
