extends Node

signal selected_counter_changed

var selected_counter: Counter

func set_selected_counter(new_selected_counter: Counter) -> void:
    selected_counter = new_selected_counter
    selected_counter_changed.emit()