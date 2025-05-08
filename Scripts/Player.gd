extends CharacterBody3D
class_name Player

@export var movement_speed: float = 7.0

func _physics_process(delta: float) -> void:
	
	var input_dir := Input.get_vector("Move_Left", "Move_Right", "Move_Up", "Move_Down")
	var direction := Vector3(input_dir.x, 0, input_dir.y).normalized()
	if direction:
		velocity.x = direction.x * movement_speed
		velocity.z = direction.z * movement_speed
	else:
		velocity.x = move_toward(velocity.x, 0, movement_speed)
		velocity.z = move_toward(velocity.z, 0, movement_speed)

	if direction:
		var rotate_speed : float = 10
		var target_basis := Basis(Vector3(0, 1, 0), atan2(direction.x, direction.z))
		set_basis(basis.slerp(target_basis, rotate_speed * delta))

	move_and_slide()

