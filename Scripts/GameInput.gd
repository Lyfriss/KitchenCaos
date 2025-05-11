extends Node
class_name GameInput

signal interact

func _unhandled_key_input(event: InputEvent) -> void:
    if event.is_action_pressed("Interact"):
        emit_signal("interact")


func get_player_movement_vector() -> Vector2:
    return Vector2(Input.get_vector("Move_Left", "Move_Right", "Move_Up", "Move_Down"))