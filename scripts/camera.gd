extends Camera2D

@export var shake_strength := 5.0
@export var shake_duration := 0.3

var shake_timer := 0.0
var rng := RandomNumberGenerator.new()
var original_offset := Vector2.ZERO

func _ready():
	Global.game_over.connect(shake)
	rng.randomize()
	original_offset = offset

func _process(delta):
	if shake_timer > 0.0:
		shake_timer -= delta
		var x = rng.randf_range(-shake_strength, shake_strength)
		var y = rng.randf_range(-shake_strength, shake_strength)
		offset = original_offset + Vector2(x, y)
	else:
		offset = original_offset

func shake():
	shake_timer = shake_duration
