extends CharacterBody3D
class_name Player

@export_category("Dependencies")
@export var gameInput: GameInput
@export var interaction_ray: RayCast3D
@export var hand : Marker3D

@export_category("Movement")
@export var movement_speed: float = 7.0

var is_moving: bool = false
var selected_counter: Counter
var held_kitchen_object: KitchenObject

func _ready() -> void:
	gameInput.interact.connect(handle_interaction)
	gameInput.interact_2.connect(handle_interaction_2)
	selected_counter = null
	held_kitchen_object = null

func _physics_process(delta: float) -> void:
	handle_movement(delta)
	handle_selection()
	

func handle_movement(delta: float) -> void:
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

func handle_selection() -> void:
	if interaction_ray.get_collider() is Counter:
		set_selected_counter(interaction_ray.get_collider())
	else :
		set_selected_counter(null)

func set_selected_counter(counter: Counter) -> void:
	selected_counter = counter
	GameManager.set_selected_counter(selected_counter)

func handle_interaction() -> void:

	if selected_counter:
		selected_counter.interact(self)

	if held_kitchen_object:
		held_kitchen_object.interact(self)