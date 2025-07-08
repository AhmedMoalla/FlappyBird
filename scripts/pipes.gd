extends "res://scripts/scrollable.gd"

func get_next_position() -> Vector2:
	return Vector2(position.x + Global.pipe_distance, randi_range(Global.pipe_min_y, Global.pipe_max_y))
 

func _on_score_trigger_body_entered(_body: Node2D) -> void:
	Global.score += 1
