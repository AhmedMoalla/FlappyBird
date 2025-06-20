extends TextureRect

@export var number = 0:
	set(value):
		number = clampi(value, 0, 9)
		texture = sprites[number]
@export var sprites: Array[CompressedTexture2D]


func _ready() -> void:
	texture = sprites[0]
