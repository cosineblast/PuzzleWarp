extends Node3D

static var LogicSpec = preload("res://Src/LogicSpec.gd")


var _spec

@export
var spec: String:
	set(value):
		set_spec(LogicSpec.parse(value))


var _mesh_instance: MeshInstance3D

func set_spec(value):
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


func _process(delta):
	if _mesh_instance == null:
		return

	_mesh_instance.rotate_y(delta)

