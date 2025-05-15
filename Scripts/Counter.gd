extends Node3D
class_name Counter

@export var counterName: String = "Counter"
@export var top: Marker3D

var ingridient_instance: KitchenObject

func interact(_player: Player) -> void:
	print("I forgot something");


func give_kitchen_object() -> KitchenObject:
	var obj = ingridient_instance
	ingridient_instance = null
	return obj
