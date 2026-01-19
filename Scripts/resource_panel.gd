class_name ResourcePanel

extends Node3D

var camera : XRCamera3D
var resource_txt : Dictionary

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	camera = get_node("/root/Origin/XROrigin3D/XRCamera3D")
	for type in Resources.Type.values():
		resource_txt[type] = get_child(0).get_child(1).get_child(type)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.look_at(camera.global_position)

func update_data() -> void:
	for type in Resources.Type.values():
		resource_txt[type].mesh.text = str(Resources.left[type])
