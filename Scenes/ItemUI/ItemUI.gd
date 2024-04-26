extends Control

signal exit()

@onready
var item_name_label: RichTextLabel = $VBoxContainer/PanelContainer/RichTextLabel

var current_object = null : set = _set_current_object, get = _get_current_object
	
var _current_object = null
	
func _set_current_object(target):
	if target != null:
		item_name_label.text = "[center]\n" + target.get_text() + "\n[/center]\n"
	
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

func _on_leave_button_pressed():
	_exit()
