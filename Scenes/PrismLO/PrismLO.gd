extends LogicObject

static var LogicSpec = preload("res://Src/LogicSpec.gd")

func get_spec():
	return LogicSpec.get_red_prism()
