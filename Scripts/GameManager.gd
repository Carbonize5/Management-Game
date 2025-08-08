extends Node

@export var seed_value : String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if seed_value != "" and seed_value != null : WorldMap.set_seed(seed_value.hash()) 
	WorldMap.initialise_parameters($"../World")
	WorldMap.start_gen_world_around_castle(2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func hover_tile() -> void:
	pass
