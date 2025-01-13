# TODO: improve this
# Right now, this LO spawns two logic objects,
# removes their collisions, then adds them as children.
# it makes a lot more sense to spawn the objects, take their 3D meshes,
# and put those as children instead.

extends LogicObject

const LogicSpec = preload("res://Src/LogicSpec.gd")

var _first_spec_string: String
var _first_spec

@export
var first_spec_string: String:
	get: return _first_spec_string
	set(value):
		_first_spec_string = value
		_first_spec = LogicSpec.parse(value)
		assert(_first_spec != null)

var _second_spec_string: String
var _second_spec

@export
var second_spec_string: String:
	get: return _second_spec_string
	set(value):
		_second_spec_string = value
		_second_spec = LogicSpec.parse(value)
		assert(_second_spec != null)

var first_child: LogicObject = null
var _first_child_original_collision_layer

var second_child: LogicObject = null
var _second_child_original_collision_layer

var dead = false

# Called when the node enters the scene tree for the first time.
func _ready():
	assert(_first_spec != null)
	assert(_second_spec != null)

	add_child(LogicSpec.spawn_object(_first_spec))
	add_child(LogicSpec.spawn_object(_second_spec))

	var logic_children = []

	for child in get_children():
		if child is LogicObject:
			logic_children.append(child)

	assert(logic_children.size() == 2)

	first_child = logic_children[0]
	second_child = logic_children[1]

	_first_child_original_collision_layer = first_child.collision_layer
	first_child.collision_layer = 0

	_second_child_original_collision_layer = second_child.collision_layer
	second_child.collision_layer = 0

	first_child.freeze = true
	second_child.freeze = true

	pass # Replace with function body.


func get_spec():
	return LogicSpec.get_same_space(_first_spec, _second_spec)

func get_options():
	return [{
		"name": "Pick " + LogicSpec.get_text_of(first_child.get_spec()),
		"callback": on_pick_first
	}, {
		"name": "Pick " + LogicSpec.get_text_of(second_child.get_spec()),
		"callback": on_pick_second
	}]

func on_pick_first():
	if dead:
		print("warning: dead pick 1")
		return

	print("Picking first child")
	pick_child(first_child)
	first_child.collision_layer = _first_child_original_collision_layer


func on_pick_second():
	if dead:
		print("warning: dead pick 2")
		return

	print("Picking second child")
	pick_child(second_child)
	second_child.collision_layer = _second_child_original_collision_layer

func pick_child(child: LogicObject):
	child.freeze = false

	remove_child(child)
	add_sibling(child)
	child.transform = transform
	get_parent().remove_child(self)
	dead = true
