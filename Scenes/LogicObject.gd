extends RigidBody3D

class_name LogicObject

var player_target_position: Marker3D = null



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _integrate_forces(state):
	pass

func assign_target_position(position: Marker3D):
	self.player_target_position = position
