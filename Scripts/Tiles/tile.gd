class_name Tile

extends Node3D

enum Type {DEFAULT, CASTLE, PLAIN, FOREST, MOUNTAIN, VILLAGE, LUMBERJACK, MINE, FARM}
var is_type : Type = Type.DEFAULT
var building_cost : Array[Resources.ResourceAndQuantity]
var building_give : Array[Resources.ResourceAndQuantity]
var extra_on_destruction : Array[Resources.ResourceAndQuantity]
var is_in_castle_radius : bool = false
var can_build_upon : bool = false

func _exit_tree() -> void:
	pass

func _enter_tree() -> void:
	pass

#func _init(type:Type, cost:Array, give:Array, extra:Array, build_on:bool) -> void:
	#is_type = type
	#building_cost = cost
	#building_give = give
	#extra_on_destruction = extra
	#can_build_upon = build_on
	#is_in_castle_radius = WorldMap.is_in_castle_radius(global_position)
