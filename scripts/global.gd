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
		


func reset_score_and_save_best_score() -> void:
	if score > best_score:
		save_best_score(score)
		best_score = score
	score = 0


var best_score_path: String= "user://best_score.save"
var best_score: int = load_best_score()


func save_best_score(new_score: int):
	var file = FileAccess.open(best_score_path, FileAccess.WRITE)
	file.store_32(new_score)
	file.close()


func load_best_score() -> int:
	if FileAccess.file_exists(best_score_path):
		var file = FileAccess.open(best_score_path, FileAccess.READ)
		var best_score_from_file: int = file.get_32()
		file.close()
		return best_score_from_file
	else:
		return 0
