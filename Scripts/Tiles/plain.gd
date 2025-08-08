class_name Plain

extends Tile

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	is_type = Type.PLAIN
	can_build_upon = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
