class_name WatchTower

extends Tile

func _init() -> void:
	is_type = Type.WATCHTOWER
	default_mesh = load("res://Import/TP3/building_tower.obj")
	can_build_upon = true
	is_tile_visible = true
	building_cost = [Resources.ResourceAndQuantity.new(Resources.Type.PEOPLE, 1), Resources.ResourceAndQuantity.new(Resources.Type.STONE, 3)]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	# Extend building radius

func _enter_tree() -> void:
	super()
	WorldMap.vision_buildings_array.append(self)

func _exit_tree() -> void:
	super()
	WorldMap.vision_buildings_array.remove_at(WorldMap.vision_buildings_array.find(self, 1))
