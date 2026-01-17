extends Node

var xr_interface: XRInterface
@export var enable_vr_debug: bool = false

func _ready():
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		print("OpenXR initialized successfully")

		# Turn off v-sync!
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

		# Change our main viewport to output to the HMD
		get_viewport().use_xr = true
		
		# Disabling PC commands
		$XROrigin3D/XRCamera3D/PCRayCast.set_process(false)
		$XROrigin3D/XRCamera3D/PCRayCast.hide()
		$HUD.hide()
		var node:Node3D = load("res://Scenes/Manager/vr_manager.tscn").instantiate()
		add_child(node)
	else:
		# Disabling VR commands
		$XROrigin3D/LeftController.set_process(false)
		$XROrigin3D/RightController.set_process(false)
		$XROrigin3D/LeftController.hide()
		$XROrigin3D/RightController.hide()
		print("PC commands initialized successfully")
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		# print("OpenXR not initialized, please check if your headset is connected")
		var node:Node3D = load("res://Scenes/Manager/pc_manager.tscn").instantiate()
		add_child(node)
	set_vr_debug(enable_vr_debug)

func set_vr_debug(enable:bool) -> void:
	if enable:
		$XROrigin3D/VRDebug.set_process(true)
		$XROrigin3D/VRDebug.show()
	else:
		$XROrigin3D/VRDebug.set_process(false)
		$XROrigin3D/VRDebug.hide()
