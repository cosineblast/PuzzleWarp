extends Control

const LogicSpec = preload("res://Src/LogicSpec.gd")

signal exit()

@onready
var item_name_label: RichTextLabel = $VBoxContainer/PanelContainer/RichTextLabel

@onready
var buttons: VBoxContainer = $VBoxContainer/PanelContainer2/VBoxContainer

@onready
var leave_button: Button = $VBoxContainer/PanelContainer2/VBoxContainer/LeaveButton

var current_object = null : set = _set_current_object, get = _get_current_object

var _current_object = null

func _set_current_object(target: LogicObject):
	for button in buttons.get_children():
			buttons.remove_child(button)

	if target != null:
		var target_text = LogicSpec.get_text_of(target.get_spec())

		item_name_label.text = "[center]\n" + target_text + "\n[/center]\n"

		for option in target.get_options():
			var button = Button.new()
			button.text = option["name"]
			buttons.add_child(button)

			var on_press = func():
				option["callback"].call()
				exit.emit()

			button.pressed.connect(on_press)

		buttons.add_child(leave_button)


	_current_object = target

func _get_current_object():
	return _current_object

func handle_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			_exit()

func _exit():
	current_object = null
	exit.emit()

func _ready():
	leave_button.pressed.connect(_exit)
