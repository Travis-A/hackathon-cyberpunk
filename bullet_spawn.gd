extends Node2D

var bullet_scene = preload("res://bullet.tscn")
@export_enum("single", "auto", "spread") var bullet_type

func shoot():
	var target = get_global_mouse_position()
	var bullet = bullet_scene.instantiate()
	if bullet:
		bullet.global_position = global_position
		bullet.global_rotation = global_rotation
		get_tree().current_scene.add_child(bullet)

func change_weapon():
	pass
