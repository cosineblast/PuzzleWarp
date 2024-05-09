extends Node3D

var inputs: Array = []

var outputs: Array = []

@onready
var input_markers: Array = [$Input1, $Input2, $Input3, $Input4, $Input5]

# Called when the node enters the scene tree for the first time.
func _ready():
	var inputs_node = $Inputs
	assert(inputs_node != null)

	var i = 0

	for child in inputs_node.get_children():
		inputs.append(child)

		child.position = input_markers[i].position
		i += 1


	var outputs_node = $Outputs
	assert(outputs_node != null)

	for child in outputs_node.get_children():
		# assert(child.is_class("LogicObject"))
		outputs.append(child)
		outputs_node.remove_child(child)

