extends ColorRect

@export var flash_duration := 0.2  # Total time for the flash (in seconds)

var flash_timer := 0.0
var flashing := false

func _ready():
	visible = true
	Global.game_over.connect(flash)
	modulate.a = 0.0  # Make sure it's initially invisible

func _process(delta):
	if flashing:
		flash_timer -= delta
		modulate.a = flash_timer / flash_duration
		if flash_timer <= 0.0:
			modulate.a = 0.0
			flashing = false

func flash():
	flash_timer = flash_duration
	modulate.a = 0.5
	flashing = true
