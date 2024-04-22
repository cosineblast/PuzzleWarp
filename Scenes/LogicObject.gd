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
	if player_target_position == null:
		return
	
	var this_position = self.global_position
	var their_position = player_target_position.global_position
	
	var difference = their_position - this_position
	var direction = difference.normalized()
	
	var object_speed = difference.length() * 5
	
	if difference.length() > 0.1:
		state.linear_velocity = direction * object_speed
	else:
		state.linear_velocity *= 0
		
func assign_target_position(marker: Marker3D):
	self.player_target_position = marker
	self.gravity_scale = 0
	self.can_sleep = false
	print(self, ": target position assigned to", marker.global_position)
	
func remove_target_position():
	self.player_target_position = null
	self.gravity_scale = 1
	self.can_sleep = true
	print(self, ": removed target position")
