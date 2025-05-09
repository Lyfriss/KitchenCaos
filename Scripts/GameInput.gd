extends Node
class_name GameInput

func get_player_movement_vector() -> Vector2:
    return Vector2(Input.get_vector("Move_Left", "Move_Right", "Move_Up", "Move_Down"))