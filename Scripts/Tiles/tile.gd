class_name Tile

extends Node3D

enum Type {DEFAULT, CASTLE, PLAIN, FOREST, MOUNTAIN, VILLAGE, LUMBERJACK, MINE, FARM, WATCHTOWER}
var is_type : Type = Type.DEFAULT #Might be useless in the end
var building_cost : Array[Resources.ResourceAndQuantity] #Define the cost of the tile
var building_give : Array[Resources.ResourceAndQuantity] #Define what you get in exchange
var extra_on_destruction : Array[Resources.ResourceAndQuantity] #Resources awarded at destruction
var default_mesh : Mesh = load("res://Import/TP3/grass.obj")
var hidden_mesh : Mesh = load("res://Import/TP3/grass.obj")
var hidden_mat : StandardMaterial3D = load("res://Materials/hidden.tres")
var is_tile_visible : bool = false #is the tile in vision range
var can_build_upon : bool = false #Define if another tile can take it place

func set_tile_visible(b:bool) -> void:
	is_tile_visible = b
	var meshInst : MeshInstance3D = get_child(6)
	if is_tile_visible:
		meshInst.mesh = default_mesh
		meshInst.material_override = null
	else:
		meshInst.mesh = hidden_mesh
		meshInst.material_override = hidden_mat

func _exit_tree() -> void:
	if  not extra_on_destruction.is_empty():
		for RnQ in extra_on_destruction:
			Resources.add_resource(RnQ)
	if  not building_cost.is_empty():
		for RnQ in building_cost:
			Resources.add_resource(RnQ)
	if  not building_give.is_empty():
		for RnQ in building_give:
			Resources.remove_resource(RnQ)

func _enter_tree() -> void:
	if  not building_cost.is_empty():
		for RnQ in building_cost:
			Resources.remove_resource(RnQ)
	if  not building_give.is_empty():
		for RnQ in building_give:
			Resources.add_resource(RnQ)

#func _init(type:Type, cost:Array, give:Array, extra:Array, build_on:bool) -> void:
	#is_type = type
	#building_cost = cost
	#building_give = give
	#extra_on_destruction = extra
	#can_build_upon = build_on
	#is_in_castle_radius = WorldMap.is_in_castle_radius(global_position)
