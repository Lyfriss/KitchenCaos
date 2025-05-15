extends Node3D
class_name KitchenObject


func change_holder(new_parent: Node3D):
    get_parent().remove_child(self)
    new_parent.add_child(self)
    global_transform.origin = new_parent.global_transform.origin

