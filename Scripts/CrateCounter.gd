extends Counter
class_name CrateCounter

@export var ingridient: KitchenObjectSO

func interact(player: Player) -> void:
	if !ingridient_instance and !player.held_kitchen_object:
		print("spawn ingridient & gives it")
		ingridient_instance = ingridient.scene.instantiate()
		add_child(ingridient_instance)

		player.held_kitchen_object = give_kitchen_object()
		player.held_kitchen_object.change_holder(player.hand)
