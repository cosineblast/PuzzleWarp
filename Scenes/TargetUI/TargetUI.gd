extends Control

const LogicSpec = preload("res://Src/LogicSpec.gd")

signal exit()

@onready
var item_name_label: RichTextLabel = %ItemNameLabel

@onready
var leave_button: Button = %LeaveButton

var current_spec:
	set(value): _set_current_spec(value)
	get: return _current_spec

var _current_spec

func _set_current_spec(target):
	if target != null:
		var target_text = LogicSpec.get_text_of(target)

		item_name_label.text = "[center]\n" + target_text + "\n[/center]\n"

	_current_spec = target

func handle_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			_exit()

func _exit():
	print("???")
	current_spec = null
	exit.emit()

func _ready():
	leave_button.pressed.connect(_exit)
