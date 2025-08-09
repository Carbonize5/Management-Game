extends Node

@export var seed_value : String
@export var is_castle_centered : bool
@export var max_world_map_range : float = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if seed_value != "" and seed_value != null : WorldMap.set_seed(seed_value.hash())
	WorldMap.initialise_parameters($"../World")
	if is_castle_centered:
		WorldMap.start_gen_world_around_castle(max_world_map_range)
	else:
		WorldMap.start_gen_world(max_world_map_range)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func hover_tile() -> void:
	pass
