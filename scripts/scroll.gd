extends Node

var stop_scrolling: bool = false
var child_outside_screen: Node

func _ready() -> void:
	Global.game_over.connect(on_game_over)
	for child in get_children():
		child.screen_exited.connect(on_child_screen_exited)


func _on_child_entered_tree(child: Node) -> void:
	child.screen_exited.connect(on_child_screen_exited)


func _process(delta: float) -> void:
	if stop_scrolling:
		return
	
	var children = get_children()
	for child in children:
		child.translate(Vector2(-Global.scroll_speed * delta, 0))
		
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


func on_game_over() -> void:
	stop_scrolling = true
