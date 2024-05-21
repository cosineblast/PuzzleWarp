
# data LogicSpec = Disk | Prism | SameSpace LogicSpec LogicSpec

static var PrismLO = preload("res://Scenes/PrismLO/PrismLO.tscn")
static var PurpleDiskLO  = preload("res://Scenes/PurpleDiskLO/PurpleDiskLO.tscn")

static func get_red_prism():
	return {
		"type": "primitive",
		"id": "red_prism"
	}

static func get_purple_disk():
	return {
		"type": "primitive",
		"id": "disk"
	}

static func get_same_space(left, right):
	return {
		"type": "same_space",
		"left": left,
		"right": right
	}

static func parse(name: String):
	match name:
		"PurpleDisk": return get_purple_disk()
		"RedPrism": return get_red_prism()
		"PurpleDisk & RedPrism": return get_same_space(get_purple_disk(), get_red_prism())
		"RedPrism & PurpleDisk": return get_same_space(get_red_prism(), get_purple_disk())

static func get_text_of(spec):
	match spec:
		{"type": "primitive", "id": "red_prism"}: return "RedPrism"
		{"type": "primitive", "id": "disk"}: return "PurpleDisk"
		{"type": "same_space", "left": var left, "right": var right}:
			return get_text_of(left) + " & " + get_text_of(right)

static func spawn_object(spec):
	match spec:
		{"type": "primitive", "id": "red_prism"}: return PrismLO.instantiate()
		{"type": "primitive", "id": "disk"}: return PurpleDiskLO.instantiate()
		{"type": "same_space", "left": var left, "right": var right}:
			# TODO
			return null

