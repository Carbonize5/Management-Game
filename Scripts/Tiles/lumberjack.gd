class_name Lumberjack

extends Tile

var future_pos:Vector3 = Vector3.ZERO

func _init() -> void:
	is_type = Type.LUMBERJACK
	default_mesh = load("res://Import/TP3/dirt_lumber.obj")
	can_build_upon = true
	building_cost = [Resources.ResourceAndQuantity.new(Resources.Type.PEOPLE, 1)]

func set_future_position(global_pos:Vector3):
	future_pos = global_pos

func _enter_tree() -> void:
	print(global_position)
	var neighbors : Array[Tile] = WorldMap.get_neighbors(global_position)
	var nb_of_forest : int = 0
	for tile : Tile in neighbors:
		if tile.is_type == Tile.Type.FOREST:
			nb_of_forest+=1
			if not tile.is_tile_visible:
				tile.is_tile_visible = true
	building_give = [Resources.ResourceAndQuantity.new(Resources.Type.WOOD,nb_of_forest)]
	super()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
