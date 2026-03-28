extends Node

class_name EnemyLogic

@export_enum("melee", "ranged") var enemy_type
var target : CharacterBody2D

@export var health : Health
@export var range : float = 50
var can_attack : bool = true
@onready var body: CharacterBody2D = $".."

@export var melee_hitbox : Attack
@export var cooldown_timer : Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	target = get_tree().get_first_node_in_group("Player")

func _process(delta: float) -> void:
	var distance = body.global_position.distance_to(target.global_position)
	if distance <= range and can_attack:
		if enemy_type == 0:
			melee_attack()
		elif enemy_type == 1:
			ranged_attack()


func _on_health_death() -> void:
	await get_tree().create_timer(1).timeout
	$"..".queue_free()

func ranged_attack() -> void:
	pass

func melee_attack() -> void:
	print("attack!")
	can_attack = false
	melee_hitbox.attack_shape.disabled = false
	await get_tree().create_timer(.2).timeout
	melee_hitbox.attack_shape.disabled = true
	cooldown_timer.start()


func _on_attack_cooldown_timeout() -> void:
	can_attack = true
