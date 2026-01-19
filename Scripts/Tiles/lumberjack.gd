class_name Lumberjack

extends Tile

func _init() -> void:
	is_type = Type.LUMBERJACK
	default_mesh = load("res://Import/TP3/dirt_lumber.obj")
	can_build_upon = true
	building_cost = [Resources.ResourceAndQuantity.new(Resources.Type.PEOPLE, 1)]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
