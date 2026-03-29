extends Node

class_name Health

@export var max_health : int = 100
var current_health : int
var is_alive : bool = true
signal death

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_health = max_health

func hurt(damage : int) -> void:
	if is_alive:
		current_health -= damage
		if current_health <= 0:
			is_alive = false
			death.emit()
