extends LogicObject

const LogicSpec = preload("res://Src/LogicSpec.gd")

func get_spec():

	assert(LogicSpec != null)

	return LogicSpec.get_purple_disk()
