extends Node3D

@export var counter: Counter
@export var selected_visual: MeshInstance3D

func _ready() -> void:
    selected_visual.visible = false
    GameManager.selected_counter_changed.connect(on_selected_counter_changed)

func on_selected_counter_changed() -> void:
    selected_visual.visible = counter == GameManager.selected_counter