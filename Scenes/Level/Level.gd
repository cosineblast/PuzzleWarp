extends Node3D


@onready
var player = $Player

@onready
var gui_container = $ObjectGUIContainer

@onready
var crosshair_container = $CrosshairContainer

@onready
var item_ui = $ObjectGUIContainer/ObjectGUI/ItemUI

@onready
var target_ui = $ObjectGUIContainer/ObjectGUI/TargetUI

# handling_player | handling_item_ui
enum State {HANDLING_PLAYER, HANDLING_ITEM_UI, HANDLING_TARGET_UI}

var state = State.HANDLING_PLAYER

func _ready():
	player.asking_object_details.connect(show_object_info)
	player.asking_target_details.connect(show_target_info)
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func show_object_info(logic_object):
	print("Showing info of ", logic_object)

	gui_container.visible = true
	item_ui.visible = true

	crosshair_container.visible = false

	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

	item_ui.current_object = logic_object

	_switch_state(State.HANDLING_ITEM_UI)

func hide_object_info():
	print("Hiding object info")

	gui_container.visible = false
	item_ui.visible = false

	crosshair_container.visible = true
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

	item_ui.current_object = null

	_switch_state(State.HANDLING_PLAYER)


	# this is a dirty fix to avoid the issue that
	# when a same_space object collapses into one of its variants,
	# it is erased, but the player is still holding the previous logic object
	# the correct thing to do in this situation would probably be to
	# make the same_space find the player and force it to drop, only when
	# it collapses
	player.drop_current_item()


func show_target_info(target):
	print("Showing info of target ", target)

	gui_container.visible = true
	target_ui.visible = true

	crosshair_container.visible = false

	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

	target_ui.current_spec = target.spec

	_switch_state(State.HANDLING_TARGET_UI)

func hide_target_info():
	print("Hiding object info")

	gui_container.visible = false
	target_ui.visible = false

	crosshair_container.visible = true
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

	item_ui.current_object = null

	_switch_state(State.HANDLING_PLAYER)

func _switch_state(target: State):
	target_ui.ignore_input = target != State.HANDLING_TARGET_UI
	item_ui.ignore_input = target != State.HANDLING_ITEM_UI
	player.ignore_input = target != State.HANDLING_PLAYER
	state = target

func _on_item_ui_exit():
	if state == State.HANDLING_ITEM_UI:
		hide_object_info()


func _on_target_ui_exit():
	if state == State.HANDLING_TARGET_UI:
		hide_target_info()
