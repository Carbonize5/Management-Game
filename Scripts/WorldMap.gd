extends Node

var world_origin : Node3D
var castle_tile : Tile
var map_tiles : Dictionary

func initialise_parameters(origin:Node3D, castle:Tile) -> void:
	world_origin = origin
	castle_tile = castle
	map_tiles[position_in_world_origin(castle.global_position)] = castle
 
func gen_world_around_castle(max_range:float) -> void:
	pass

func position_in_world_origin(world_position:Vector3) -> Vector3:
	return world_origin.global_transform * world_position

func is_in_castle_radius(world_position:Vector3) -> bool:
	return false
