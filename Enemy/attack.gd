extends Area2D

class_name Attack

@export var attack_shape : CollisionShape2D
@export var player_attack : bool = false
@export var damage : int = 10

func _on_area_entered(area: Area2D) -> void:
	if player_attack:
		if area.is_in_group("Enemy"):
			area.health.hurt(damage)
	else:
		if area.is_in_group("Player"):
			area.health.hurt(damage)
