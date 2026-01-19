class_name Mountain

extends Tile

func _init() -> void:
	is_type = Type.MOUNTAIN
	default_mesh = load("res://Import/TP3/stone_mountain.obj")
	can_build_upon = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
