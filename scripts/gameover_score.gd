extends CanvasLayer


func _ready() -> void:
	Global.game_over.connect(show_score)


func show_score() -> void:
	visible = true
	$AnimationPlayer.play("display_animation")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "display_animation":
		$ScoreBoard/BestScore.set_score(Global.best_score)
		var tweener = $ScoreBoard/Score.tween_score(Global.score)
		tweener.finished.connect(show_buttons)


func show_buttons() -> void:
	if Global.score > Global.best_score:
		$ScoreBoard/BestScore.tween_score(Global.score)
	Global.reset_score_and_save_best_score()
	$PlayButton.visible = true
	$ScoreButton.visible = true


func _on_play_button_pressed() -> void:
	$AnimationPlayer.play("restart_fadeout")


func reload_scene() -> void:
	get_tree().reload_current_scene()
