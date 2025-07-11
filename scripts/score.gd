extends BoxContainer

var score_number_scene: PackedScene = preload("res://scenes/score_number.tscn")

func _ready() -> void:
	add_score_number_child()


var displayed_score = 0


func tween_score(score: int) -> Tween:
	var tween: Tween = create_tween()
	tween.tween_method(set_score, displayed_score, score, 0.5)
	return tween


func set_score(score: int) -> void:
	displayed_score = score
	var score_numbers = get_children()
	var digits = get_score_digits(score)
	for i in digits.size():
		if i == score_numbers.size():
			add_score_number_child()
			score_numbers = get_children()
			
		var score_number = score_numbers[i]
		score_number.number = digits[i]


func add_score_number_child() -> void:
	var score_number = score_number_scene.instantiate()
	score_number.number = 0
	add_child(score_number)


func get_score_digits(score: int) -> Array[int]:
	var result: Array[int] = []
	var divisor := 1
	while score / divisor >= 10:
		divisor *= 10

	while divisor > 0:
		var digit := score / divisor
		result.append(digit)
		score %= divisor
		divisor /= 10
	
	return result
