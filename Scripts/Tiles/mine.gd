class_name Mine

extends Tile


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	is_type = Type.MINE
	default_mesh = load("res://Import/TP3/building_mine.obj")
	can_build_upon = true
	building_cost = [Resources.ResourceAndQuantity.new(Resources.Type.PEOPLE, 1), Resources.ResourceAndQuantity.new(Resources.Type.WOOD, 2)]
	building_give = [Resources.ResourceAndQuantity.new(Resources.Type.STONE, 3)]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
