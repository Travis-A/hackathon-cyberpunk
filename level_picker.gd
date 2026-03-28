extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_lvl1_pressed() -> void:
	get_tree().change_scene_to_file("res://sam_testing_area.tscn")


func _on_lvl2_pressed() -> void:
	print("add lvl2")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
