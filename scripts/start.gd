extends TextureButton

var game_scene: PackedScene = load("res://scenes/main.tscn")

func _on_pressed() -> void:
	get_tree().change_scene_to_packed(game_scene)
