extends Node

var enemy_scene = preload("res://Enemy/enemy.tscn")

@export var spawn_locations : Array[Node2D]

func spawn_enemy():
	var spawn_pos = spawn_locations.pick_random().global_position
	var enemy = enemy_scene.instantiate()
	enemy.global_position = spawn_pos
	get_tree().current_scene.add_child(enemy)


func _on_timer_timeout() -> void:
	spawn_enemy()
