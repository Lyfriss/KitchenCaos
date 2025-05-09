extends CharacterBody3D
class_name Player

@export_category("Dependencies")
@export var gameInput: GameInput
@export var interaction_ray: RayCast3D

@export var movement_speed: float = 7.0

var is_moving: bool = false

func _physics_process(delta: float) -> void:
	_handle_movement(delta)
	_handle_interaction()
	

func _handle_movement(delta: float) -> void:
	var input_dir := gameInput.get_player_movement_vector()
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

	is_moving = direction != Vector3.ZERO
	move_and_slide()

func _handle_interaction() -> void:
	if interaction_ray.get_collider().has_method("interact"):
		interaction_ray.get_collider().interact()
