class_name GameManager

extends Node

@export var seed_value : String = "#fantasy"
@export var is_castle_centered : bool = false
@export var max_world_map_range : float = 10
var XROrigin : XROrigin3D
var target_tile : Tile
var tile_to_build : PackedScene
var granted_mat : StandardMaterial3D
var denied_mat : StandardMaterial3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	XROrigin = get_node("/root/Origin/XROrigin3D")
	granted_mat = load("res://Materials/granted.material")
	denied_mat = load("res://Materials/denied.material")
	if seed_value != "" and seed_value != null : WorldMap.set_seed(seed_value.hash())
	WorldMap.initialise_parameters($"../World")
	if is_castle_centered:
		WorldMap.start_gen_world_around_castle(max_world_map_range)
	else:
		WorldMap.start_gen_world(max_world_map_range)
	WorldMap.refresh_vision()
	Resources.set_start_resources(0,0,0,0)

func hover_tile(raycast : RayCast3D) -> void:
	if raycast.is_colliding():
		if target_tile == raycast.get_collider().get_parent() and target_tile.is_tile_visible:
			var mesh:MeshInstance3D = target_tile.get_child(6)
			if TileSelector.enabled : mesh.mesh = TileSelector.visual.default_mesh
			set_hover_mat(mesh)
		else:
			reset_previous_target()
			target_tile = raycast.get_collider().get_parent()
	else:
		reset_previous_target()
		target_tile = null

func reset_previous_target():
	if target_tile != null and target_tile.is_tile_visible:
				var mesh:MeshInstance3D = target_tile.get_child(6)
				mesh.mesh = target_tile.default_mesh
				mesh.material_override = null

func build_tile() -> void:
	var old_tile = WorldMap.get_tile(WorldMap.position_in_world_origin(target_tile.gloabl_position))
	WorldMap.world_origin.remove_child(old_tile)
	old_tile.queue_free()
	WorldMap.world_origin.add_child(TileSelector.visual)
	TileSelector.new_visual()
	Resources.panel.update_data()

func set_hover_mat(mesh:MeshInstance3D) -> void:
	if target_tile.is_tile_visible:
		if target_tile.can_build_upon and Resources.has_enough_resource_to_build(TileSelector.visual.building_cost):
			mesh.material_override = granted_mat
		else:
			mesh.material_override = denied_mat
