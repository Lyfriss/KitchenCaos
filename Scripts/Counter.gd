extends Node
class_name Counter

@export var message: String = "Interacted with counter"

func interact():
    print(message)