extends Node
class_name Counter

@export var message: String = "Interacted with counter"
@export var top: Marker3D

@export var ingridient: PackedScene

func interact():
    var ingridient_instance := ingridient.instantiate()
    add_child(ingridient_instance)
    ingridient_instance.global_position = top.global_position