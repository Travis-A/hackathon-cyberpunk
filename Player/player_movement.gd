extends CharacterBody2D

@export var health : Health
@export var speed = 200.0
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var player_logic: PlayerLogic = $PlayerLogic


func _physics_process(delta: float) -> void:
	# Movement
	var direction := Input.get_vector("moveLeft", "moveRight", "moveUp", "moveDown")
	if direction and health.is_alive:
		velocity = direction * speed
		if not player_logic.is_shooting:
			sprite.play("move")
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
		if not player_logic.is_shooting:
			sprite.play("idle")
	if player_logic.is_shooting and health.is_alive:
		sprite.play("shoot")
	
	# Look dir
	if health.is_alive:
		look_at(get_global_mouse_position())
	move_and_slide()


func _on_health_death() -> void:
	await get_tree().create_timer(3).timeout
	get_tree().reload_current_scene()
