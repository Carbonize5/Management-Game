extends Node

@export var seed_value : String
@export var is_castle_centered : bool
@export var max_world_map_range : float = 10
@export var XROrigin : XROrigin3D
@export var mouse_sensitivity : float = 0.001
@export var cam_speed:float = 1
@export var LeftController : XRController3D
@export var RightController : XRController3D
var is_free_cam : bool = true

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
	if $"..".xr_interface and not $"..".xr_interface.is_initialized():
		if is_free_cam : XROrigin.rotation.x = clamp(XROrigin.rotation.x, -1, 1)
		do_pc_control(delta)
	else:
		pass

func hover_tile() -> void:
	if $"..".xr_interface and $"..".xr_interface.is_initialized():
		pass
	else:
		pass

func _input(event: InputEvent) -> void:
	if $"..".xr_interface and not $"..".xr_interface.is_initialized():
		if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED and is_free_cam:
			XROrigin.rotate(Vector3.UP, -event.relative.x * mouse_sensitivity)
			XROrigin.rotate_object_local(Vector3.RIGHT, -event.relative.y * mouse_sensitivity)
	else:
		pass

func do_pc_control(delta:float) -> void:
	if Input.is_action_just_pressed("unlock_mouse"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		var dir:Vector3 = Vector3.ZERO
		if Input.is_action_pressed("forward"):
			dir.z-=1
		if Input.is_action_pressed("backward"):
			dir.z+=1
		if Input.is_action_pressed("left"):
			dir.x-=1
		if Input.is_action_pressed("right"):
			dir.x+=1
		if Input.is_action_pressed("down"):
			dir.y-=1
		if Input.is_action_pressed("up"):
			dir.y+=1
		# translation en fonction du temps écoulé
		dir*=delta*cam_speed
		XROrigin.translate(dir)
	else:
		if Input.is_action_just_pressed("left_mouse_click") or Input.is_action_just_pressed("right_mouse_click"):
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	
