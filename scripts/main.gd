extends Node

var pipes_scene: PackedScene = preload("res://scenes/pipes.tscn")

var starting_x_position = 500  

@export var score_node: Node

func _ready() -> void:
	$Overlay/StartBlackFadeIn.visible = true
	Global.score_changed.connect(on_score_changed)
	var current_x = starting_x_position
	for i in range(3):
		spawn_pipe("Pipes" + str(i), current_x)
		current_x += Global.pipe_distance


func spawn_pipe(pipe_name: String, x: int) -> void:
	var pipes = pipes_scene.instantiate()
	pipes.name = pipe_name
	pipes.position = Vector2(x, randi_range(Global.pipe_min_y, Global.pipe_max_y))
	$PipeScroll.add_child(pipes)


func on_score_changed(score: int) -> void:
	score_node.set_score(score)
