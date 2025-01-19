extends Node3D

const LogicSpec = preload("res://Src/LogicSpec.gd")
const LevelTargetScene = preload("res://Scenes/LevelTarget/LevelTarget.tscn")

var inputs: Array = []


@onready
var _input_markers: Array = [$Input1, $Input2, $Input3, $Input4, $Input5]

@onready
var _output_markers: Array = [$Output1, $Output2, $Output3, $Output4, $Output5]

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


func _ready():


	_load_targets()
	_load_inputs()


func _load_targets():
	var i = 0

	# right now the output count is limited to the number of output markers
	assert(len(_output_specs) < len(_output_markers))

	while i < len(_output_specs):
		var spec = _output_specs[i]
		var target = LevelTargetScene.instantiate()
		target.spec = spec

		target.matching_object_touched.connect(func(_thing): 
			target.closed = true)

		add_child(target)
		target.position = _output_markers[i].position
		i += 1




func _load_inputs():
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
		child.position = _input_markers[i].position
		i += 1

	# TODO: Add logic specs to targets
