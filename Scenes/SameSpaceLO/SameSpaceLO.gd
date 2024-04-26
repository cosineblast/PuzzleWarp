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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
