extends Node3D

class_name LevelTarget

const LogicSpec = preload("res://Src/LogicSpec.gd")

var _spec

var _closed = false

var sprite

var viewport_texture

var closed_texture = load("res://Assets/self/closed_target.png")

signal matching_object_touched(object)

@export
var spec_string: String:
	set(value):
		_set_spec(LogicSpec.parse(value))

	get: return LogicSpec.get_text_of(_spec)

@export
var closed: bool:
	set(value):
		_set_closed(value)

	get: return _closed

var spec:
	set(value): _set_spec(value)
	get: return _spec

var _mesh_instance: MeshInstance3D

func _set_spec(value):
	# TODO: allow setting the spec to null
	assert(value != null)

	_spec = value

	var object = LogicSpec.spawn_object(_spec)
	var mesh_instance: MeshInstance3D = object.get_node("MeshInstance3D")

	var node = $SubViewport/Node3D
	var mesh_position = $SubViewport/Node3D/Sample3DMesh

	mesh_instance.get_parent().remove_child(mesh_instance)

	if _mesh_instance != null:
		node.remove_child(_mesh_instance)

	node.add_child(mesh_instance)
	mesh_instance.transform = mesh_position.transform


	mesh_instance.layers = 0
	mesh_instance.set_layer_mask_value(4, true)

	_mesh_instance = mesh_instance


# Defines whether the current target is active or closed.
# When active, the target emits object_touched events when logic
# objects matching the target's spec reaches its acceptance area.
# When closed, the does not render the logic it accepts.
func _set_closed(value):
	if value and not _closed:
		_closed = true
		sprite.texture = closed_texture

	elif not value and _closed:
		_closed = false
		sprite.texture = viewport_texture

func _ready():
	sprite = $Sprite3D
	viewport_texture = sprite.texture

func _process(delta):
	if _mesh_instance == null:
		return

	_mesh_instance.rotate_y(delta)


func _on_object_entered_area(body):

	if body is LogicObject and body.get_spec() == _spec:
		print("ONE", body)
		matching_object_touched.emit(body)
