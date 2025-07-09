extends CharacterBody2D

@export var jump_velocity: int = -350
@export var max_fall_angle_deg: float = 90.0
@export var max_rise_angle_deg: float = -50.0
@export var rotation_speed: float = 3.0

var stop_moving: bool = false

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		$AnimatedSprite2D.stop()
	
	move_and_slide()
	
	if stop_moving:
		return
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if not collision.get_collider().name == "TopBoundary":
			$HitSound.play()
			$FallingSound.play()
			game_over()
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = jump_velocity
		$JumpSound.play()
	
	update_rotation(delta)


func update_rotation(delta):
	var t = clamp(velocity.y / 400.0, -1.0, 1.0)
	var target_angle = lerp_angle(deg_to_rad(max_rise_angle_deg), deg_to_rad(max_fall_angle_deg), (t + 1.0) / 2.0)
	
	rotation = lerp_angle(rotation, target_angle, delta * rotation_speed)


func game_over():
	Global.game_over.emit()
	stop_moving = true
	set_collision_mask_value(2, false) # Disable collision only with pipes
