extends CanvasLayer


func _on_timer_timeout() -> void:
	$AnimationPlayer.play("fade_out")
