extends Node

signal game_over
signal score_changed(score: int)

const scroll_speed: int = 100
const pipe_distance: int = 160
const pipe_min_y: int = 116
const pipe_max_y: int = 310

var score = 0:
	set(value):
		score = value
		score_changed.emit(score)
