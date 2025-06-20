extends Node2D

signal screen_exited(node: Node)

func _ready() -> void:
	var notifiers = find_children("*", "VisibleOnScreenNotifier2D")
	assert(notifiers.size() == 1, "Child of Scrollable node should have a VisibleOnScreenNotifier2D component connected to signal _on_visible_on_screen_notifier_2d_screen_exited")


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	screen_exited.emit(self)


func get_next_position() -> Vector2:
	assert(false, "get_next_position should be implemented in child script")
	return Vector2.ZERO
