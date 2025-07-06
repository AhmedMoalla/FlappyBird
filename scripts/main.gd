extends Node

var pipes_scene: PackedScene = preload("res://scenes/pipes.tscn")

var starting_x_position = 760

func _ready() -> void:
	var current_x = starting_x_position
	for i in range(3):
		spawn_pipe("Pipes" + str(i), current_x)
		current_x += Global.pipe_distance


func spawn_pipe(name: String, x: int) -> void:
	var pipes = pipes_scene.instantiate()
	pipes.name = name
	pipes.position = Vector2(x, randi_range(Global.pipe_min_y, Global.pipe_max_y))
	$PipeScroll.add_child(pipes)
