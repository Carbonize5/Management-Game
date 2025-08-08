class_name Forest

extends Tile


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	is_type = Type.FOREST
	can_build_upon = true
	extra_on_destruction = [Resources.ResourceAndQuantity.new(Resources.Type.WOOD, 1)]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
