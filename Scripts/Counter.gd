extends Node3D
class_name Counter

@export var message: String = "Interacted with counter"
@export var top: Marker3D

@export var ingridient: KitchenObjectSO
var ingridient_instance: KitchenObject

func interact(player: Player) -> void:
    if !ingridient_instance and !player.held_kitchen_object:
        print("spawn ingridient")
        ingridient_instance = ingridient.scene.instantiate()
        add_child(ingridient_instance)
        ingridient_instance.global_transform.origin = top.global_transform.origin
    
    elif ingridient_instance and !player.held_kitchen_object:
        print("give ingridient")
        player.held_kitchen_object = give_kitchen_object()
        player.held_kitchen_object.change_holder(player.hand)

    elif !ingridient_instance and player.held_kitchen_object:
        print("take ingridient")
        ingridient_instance = player.held_kitchen_object
        player.held_kitchen_object = null
        ingridient_instance.change_holder(self)



func give_kitchen_object() -> KitchenObject:
    var obj = ingridient_instance
    ingridient_instance = null
    return obj