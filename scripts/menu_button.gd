extends TextureButton

@export var menu_scene: PackedScene

func _on_pressed() -> void:
	get_tree().change_scene_to_packed(menu_scene)
