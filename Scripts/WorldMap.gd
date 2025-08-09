extends Node

var world_origin : Node3D
var castle_tile : Tile
var map_tiles : Dictionary
var world_tiles : Array = [load("res://Scenes/Tiles/plain_tile.tscn"),
load("res://Scenes/Tiles/forest_tile.tscn"), load("res://Scenes/Tiles/mountain_tile.tscn")]
var RNG : RandomNumberGenerator = RandomNumberGenerator.new()

func initialise_parameters(origin:Node3D) -> void:
	var castle_tile_scene : PackedScene = load("res://Scenes/Tiles/castle_tile.tscn")
	world_origin = origin
	castle_tile = castle_tile_scene.instantiate()
 
func start_gen_world_around_castle(max_range:float) -> void:
	world_origin.add_child(castle_tile)
	castle_tile.position = Vector3(0,0,0)
	map_tiles[position_in_world_origin(castle_tile.global_position)] = castle_tile
	gen_world_around_tile(castle_tile, castle_tile, max_range)

func start_gen_world(max_range:float) -> void:
	var starter_tile:Tile = pick_random_world_tile()
	world_origin.add_child(starter_tile)
	starter_tile.position = Vector3(0,0,0)
	map_tiles[position_in_world_origin(starter_tile.global_position)] = starter_tile
	gen_world_around_tile(starter_tile, starter_tile, max_range)
	world_origin.add_child(castle_tile)
	var random_tile:Tile = get_random_tile_from_map()
	castle_tile.position = random_tile.position
	map_tiles[castle_tile.position] = castle_tile
	world_origin.remove_child(random_tile)

func gen_world_around_tile(active_node:Node3D, start_tile:Tile, max_range:float) -> void:
	var neighbours : Array = active_node.get_children().slice(0,6)
	for node:Node3D in neighbours:
		var snapped_global : Vector3 = snapped(node.global_position, Vector3(0.001, 0, 0.001))
		var node_game_world_pos : Vector3 = position_in_world_origin(snapped_global)
		var dist : float = node_game_world_pos.distance_to(start_tile.position)
		if dist <= max_range and not node_game_world_pos in map_tiles:
			var tile : Tile = pick_random_world_tile()
			world_origin.add_child(tile)
			tile.global_position = snapped_global
			map_tiles[node_game_world_pos] = tile
			gen_world_around_tile(tile, start_tile, max_range)

func pick_random_world_tile() -> Tile:
	var random_value : int = RNG.randi_range(1,101)
	if random_value < 50 :
		return world_tiles[0].instantiate()
	elif random_value < 76:
		return world_tiles[1].instantiate()
	else:
		return world_tiles[2].instantiate()

func position_in_world_origin(world_position:Vector3) -> Vector3:
	return world_origin.global_transform * world_position

func is_in_castle_radius(world_position:Vector3) -> bool:
	return false

func set_seed(seed) -> void:
	RNG.seed = seed

func get_random_tile_from_map() -> Tile:
	return map_tiles[map_tiles.keys()[RNG.randi_range(0, map_tiles.size())]]
