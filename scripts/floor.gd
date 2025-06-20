extends "res://scripts/scrollable.gd"

@onready var sprite: Sprite2D = $Sprite2D

func get_next_position() -> Vector2:
	var scaled_sprite_width = sprite.get_rect().size.x * sprite.scale.x
	return Vector2(position.x + scaled_sprite_width, position.y)
