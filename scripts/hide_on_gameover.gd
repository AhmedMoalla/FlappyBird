extends CanvasItem


func _ready() -> void:
	Global.game_over.connect(hide_node)


func hide_node() -> void:
	visible = false
