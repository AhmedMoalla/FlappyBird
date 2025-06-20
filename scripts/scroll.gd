extends Node

var scroll_speed = Global.scroll_speed

var child_outside_screen: Node

func _ready() -> void:
	for child in get_children():
		child.screen_exited.connect(on_child_screen_exited)


func _on_child_entered_tree(child: Node) -> void:
	child.screen_exited.connect(on_child_screen_exited)


func _process(delta: float) -> void:
	var children = get_children()
	for child in children:
		child.translate(Vector2(-scroll_speed * delta, 0))
		
	if child_outside_screen != null:
		var last_child = find_rightmost_child(children)
		child_outside_screen.position = last_child.get_next_position()
		child_outside_screen = null


func on_child_screen_exited(child: Node) -> void:
	child_outside_screen = child


func find_rightmost_child(children: Array[Node]) -> Node:
	var max_x_child = children[0]
	var max_x = max_x_child.position.x
	for child in children:
		if child.position.x > max_x:
			max_x = child.position.x
			max_x_child = child
	return max_x_child
