extends Node3D


@onready
var player = $Player

@onready
var gui_container = $ObjectGUIContainer

@onready
var crosshair_container = $CrosshairContainer

@onready
var item_ui = $ObjectGUIContainer/ObjectGUI/ItemUI

# handling_player | handling_ui
var state = "handling_player"

func _ready():
	player.view_object.connect(show_object_info)
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func show_object_info(logic_object):
	print("Showing info of ", logic_object)

	gui_container.visible = true
	crosshair_container.visible = false

	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

	item_ui.current_object = logic_object

	state = "handling_ui"
	player.ignore_input = true

func hide_object_info():
	print("Hiding object info")

	gui_container.visible = false
	crosshair_container.visible = true
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

	item_ui.current_object = null

	state = "handling_player"

	player.drop_current_item()
	player.ignore_input = false

func _unhandled_input(event):
	if state == "handling_player":
		player.handle_input(event)
	if state == "handling_ui":
		item_ui.handle_input(event)

func _on_item_ui_exit():
	if state == "handling_ui":
		hide_object_info()
