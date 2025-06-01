extends Counter
class_name CuttingCounter

func interact(player: Player) -> void:
	if ingridient_instance and !player.held_kitchen_object:
		print("give ingridient")
		player.held_kitchen_object = give_kitchen_object()
		player.held_kitchen_object.change_holder(player.hand)

	elif !ingridient_instance and player.held_kitchen_object:
		print("take ingridient")
		ingridient_instance = player.held_kitchen_object
		player.held_kitchen_object = null
		ingridient_instance.change_holder(top)

func interact_2(player: Player) -> void:
	pass