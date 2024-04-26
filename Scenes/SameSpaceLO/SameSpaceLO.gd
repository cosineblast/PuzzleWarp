extends LogicObject

@onready
var first_child: LogicObject = $FirstChild

@onready
var second_child: LogicObject = $SecondChild

# Called when the node enters the scene tree for the first time.
func _ready():
	first_child.collision_layer = 0
	second_child.collision_layer = 0
	first_child.freeze = true
	second_child.freeze = true
	
	pass # Replace with function body.


func get_text():
	return first_child.get_text() + " & " + second_child.get_text()
	
func get_options():
	return [{
		"name": "Pick " + first_child.get_text(),
		"callback": on_pick_first
	}, {
		"name": "Pick " + second_child.get_text(),
		"callback": on_pick_second
	}]

func on_pick_first():
	print("Picking first child")
	pick_child(first_child)
	
	
func on_pick_second():
	print("Picking second child")
	pick_child(second_child)
	
func pick_child(child: LogicObject):
	child.freeze = false
	child.collision_layer = 1
	
	remove_child(child)
	add_sibling(child)
	child.transform = transform
	get_parent().remove_child(self)
	
	
	
