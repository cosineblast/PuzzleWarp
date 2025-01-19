extends Node3D

const LogicSpec = preload("res://Src/LogicSpec.gd")

var inputs: Array = []

@onready
var input_markers: Array = [$Input1, $Input2, $Input3, $Input4, $Input5]

var _output_specs: Array = []

@export
var outputs: Array[String]:
	set(value):
		var result = []

		for string in value:
			var spec = LogicSpec.parse(string)
			assert(spec != null)
			result.append(spec)

		_output_specs = result


# Called when the node enters the scene tree for the first time.
func _ready():
	# When the level loads, we look at the 'Inputs' node 
	# (which shall be added by the instantiator of this node)
	# to find the logic objects this level receives as input

	# then we take these input children and set their positions 
	# to the ones of the input markers

	var inputs_node = $Inputs

	assert(inputs_node != null)

	var i = 0

	for child in inputs_node.get_children():
		inputs.append(child)
		child.position = input_markers[i].position
		i += 1

	# TODO: Add logic specs to targets
