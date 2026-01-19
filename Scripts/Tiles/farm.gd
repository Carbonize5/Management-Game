class_name Farm

extends Tile

func _init() -> void:
	is_type = Type.FARM
	default_mesh = load("res://Import/TP3/building_farm.obj")
	can_build_upon = true
	building_cost = [Resources.ResourceAndQuantity.new(Resources.Type.PEOPLE, 1), Resources.ResourceAndQuantity.new(Resources.Type.WOOD, 1)]
	building_give = [Resources.ResourceAndQuantity.new(Resources.Type.FOOD, 2)]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
