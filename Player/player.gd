extends Node

class_name PlayerLogic

@export var bullet_spawn : Node2D
@export var health : Health
var is_shooting

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot") and health.is_alive:
		is_shooting = true
		bullet_spawn.shoot()
		await  get_tree().create_timer(.1).timeout
		is_shooting = false
