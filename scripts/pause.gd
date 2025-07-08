extends "res://scripts/hide_on_gameover.gd"

@export var pause_layer: CanvasLayer

func _on_pressed() -> void:
	get_tree().paused = true
	pause_layer.visible = true
