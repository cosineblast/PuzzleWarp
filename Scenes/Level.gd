extends Node3D


@onready
var player = $Player

@onready
var gui_container = $ObjectGUIContainer

@onready
var crosshair_container = $CrosshairContainer

func _ready():
	player.view_object.connect(show_object_info)
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func show_object_info(logic_object):
	print("Showing info of ", logic_object)
	gui_container.visible = true
	crosshair_container.visible = false
	player.ignore_input = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
