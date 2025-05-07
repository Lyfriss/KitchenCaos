extends CharacterBody3D

var movement_speed: float = 7.0

func _physics_process(_delta: float) -> void:
	
	var input_dir := Input.get_vector("Move_Left", "Move_Right", "Move_Up", "Move_Down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * movement_speed
		velocity.z = direction.z * movement_speed
	else:
		velocity.x = move_toward(velocity.x, 0, movement_speed)
		velocity.z = move_toward(velocity.z, 0, movement_speed)

	move_and_slide()

