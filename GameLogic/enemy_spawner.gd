extends Node2D

var enemy_scene = preload("res://Enemy/enemy.tscn")
var margin = 100 # Pixels outside screen



func spawn_enemy():
	var viewport_rect = get_viewport_rect()
	var spawn_pos = Vector2.ZERO
	
	# Randomly choose edge: 0=Top, 1=Bottom, 2=Left, 3=Right
	var edge = randi() % 4
	
	match edge:
		0: # Top
			spawn_pos = Vector2(randf_range(0, viewport_rect.size.x), -margin)
		1: # Bottom
			spawn_pos = Vector2(randf_range(0, viewport_rect.size.x), viewport_rect.size.y + margin)
		2: # Left
			spawn_pos = Vector2(-margin, randf_range(0, viewport_rect.size.y))
		3: # Right
			spawn_pos = Vector2(viewport_rect.size.x + margin, randf_range(0, viewport_rect.size.y))
			
	var enemy = enemy_scene.instantiate()
	enemy.global_position = spawn_pos
	get_tree().current_scene.add_child(enemy)


func _on_timer_timeout() -> void:
	spawn_enemy()
