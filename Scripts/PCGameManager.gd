class_name PCGameManager

extends GameManager

@export var mouse_sensitivity : float = 0.001
@export var cam_speed:float = 1
var is_free_cam : bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_free_cam : XROrigin.rotation.x = clamp(XROrigin.rotation.x, -1, 1)
	do_control(delta)
	hover_tile(get_node(String(XROrigin.get_path())+"/XRCamera3D/PCRayCast"))

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED and is_free_cam:
		XROrigin.rotate(Vector3.UP, -event.relative.x * mouse_sensitivity)
		XROrigin.rotate_object_local(Vector3.RIGHT, -event.relative.y * mouse_sensitivity)

func do_control(delta:float) -> void:
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
	
	
