extends Node

class_name Spawner

var enemy_scene = preload("res://Enemy/enemy.tscn")
@export var timer: Timer

@export var spawn_locations : Array[Node2D]
@export var enemies_to_spawn : int = 5
var spawns_left : int

var killed_enemies

signal end_wave

func start_round():
	killed_enemies = 0
	spawns_left = enemies_to_spawn
	timer.start()

func spawn_enemy():
	var spawn_pos = spawn_locations.pick_random().global_position
	var enemy = enemy_scene.instantiate()
	enemy.global_position = spawn_pos
	enemy.died.connect(_on_enemy_death)
	get_tree().current_scene.add_child(enemy)
	spawns_left -= 1


func _on_timer_timeout() -> void:
	if spawns_left > 0:
		spawn_enemy()
	else:
		timer.stop()
	
func _on_enemy_death() :
	killed_enemies += 1
	print(killed_enemies)
	if killed_enemies >= enemies_to_spawn:
		timer.stop
		end_wave.emit()
