extends Node

enum Type {PEOPLE, WOOD, FOOD, STONE}
var left : Dictionary

func set_start_resources(p:int, w:int, f:int, s:int) -> void:
	pass

func add_resource(resource_type:Type, amount:int) -> void:
	pass

func remove_resource(resource_type:Type, amount:int) -> void:
	pass
