extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	WorldMap.initialise_parameters($World, $World/Castle)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func hover_tile() -> void:
	pass
