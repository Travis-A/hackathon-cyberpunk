extends Area2D

@export var damage: int
@export var sprite: Sprite2D
@export var speed: float

@export var player_attack : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta


func _on_area_entered(area: Area2D) -> void:
	if player_attack:
		if area.is_in_group("Enemy"):
			area.health.hurt(damage)
	else:
		if area.is_in_group("Player"):
			area.health.hurt(damage)
	queue_free()
