extends Node

var pipes_scene: PackedScene = preload("res://scenes/pipes.tscn")

var starting_x_position = 760

func _ready() -> void:
	var current_x = starting_x_position
	for i in range(3):
		var pipes = pipes_scene.instantiate()
		pipes.name = "Pipes" + str(i)
		pipes.position = Vector2(current_x, randi_range(Global.pipe_min_y, Global.pipe_max_y))
		$PipeScroll.add_child(pipes)
		current_x += Global.pipe_distance
