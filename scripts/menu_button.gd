extends TextureButton

var menu_scene: PackedScene = load("res://scenes/menu.tscn")

func _on_pressed() -> void:
	get_tree().change_scene_to_packed(menu_scene)
