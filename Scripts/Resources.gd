extends Node

enum Type {PEOPLE, WOOD, FOOD, STONE}
var left : Dictionary

func set_start_resources(p:int, w:int, f:int, s:int) -> void:
	left[Type.PEOPLE] = p
	left[Type.WOOD] = w
	left[Type.FOOD] = f
	left[Type.STONE] = s

func add_resource(raq:ResourceAndQuantity) -> void:
	left[raq.type] += raq.quantity

func remove_resource(raq:ResourceAndQuantity) -> void:
	left[raq.type] -= raq.quantity

func has_enough_resource_to_use(raq_array : Array[ResourceAndQuantity]) -> bool:
	for raq in raq_array:
		var dif = left[raq.type] - raq.quantity
		if dif < 0:
			return false
	return true

class ResourceAndQuantity:
	var type : Resources.Type
	var quantity : int
	
	func _init(t:Resources.Type, q:int) -> void:
		type = t
		assert(q>=0, "You entered a number inferior to 0")
		quantity = q
