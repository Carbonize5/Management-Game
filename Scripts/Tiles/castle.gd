class_name Castle

extends Tile


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	is_type = Type.CASTLE
	default_mesh = load("res://Import/TP3/building_castle.obj")
	is_tile_visible = true
	can_build_upon = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
