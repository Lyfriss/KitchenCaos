extends Node3D

@export var player: Player
@export var animation_player: AnimationPlayer


func _process(_delta):
    if player.is_moving:
        animation_player.play("Walk")
    else:
        animation_player.play("Idle")