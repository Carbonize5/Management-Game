extends Node

var building_tiles:Array[PackedScene] = [load("res://Scenes/Tiles/village_tile.tscn"),load("res://Scenes/Tiles/lumberjack_tile.tscn"),load("res://Scenes/Tiles/farm_tile.tscn"),load("res://Scenes/Tiles/mine_tile.tscn"), load("res://Scenes/Tiles/watchTower_tile.tscn")]
var index : int = 0
var visual : Tile
var enabled : bool = true
#@onready var parent : Node3D = get_node("/root/Origin/World")

func _ready() -> void:
	visual = building_tiles[index].instantiate()
	#visual.is_visual = true

func next() -> void:
	index = index+1 % building_tiles.size()
	#if visual.get_parent_node_3d() == parent : parent.remove_child(visual)
	visual.queue_free()
	visual = building_tiles[index].instantiate()
	#visual.is_visual = true
	#parent.add_child(visual)

func previous() -> void:
	index = index-1 % building_tiles.size()
	#if visual.get_parent_node_3d() == parent : parent.remove_child(visual)
	visual.queue_free()
	visual = building_tiles[index].instantiate()
	#visual.is_visual = true
	#parent.add_child(visual)

func new_visual() -> void:
	visual = building_tiles[index].instantiate()

func switch_OnOff() -> void:
	enabled = !enabled

func update_visual_position(world_position : Vector3) -> void:
	visual.global_position = world_position
