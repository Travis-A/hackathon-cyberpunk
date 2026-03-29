extends Node

class_name Wave

@export var wave: int = 0
@export var spawner : Spawner

func _ready() -> void:
	spawner.end_wave.connect(_on_wave_end)
	start_wave()

# Called when the node enters the scene tree for the first time.
func start_wave():
	wave += 1
	spawner.enemies_to_spawn += 5
	spawner.start_round()

func _on_wave_end():
	start_wave()
