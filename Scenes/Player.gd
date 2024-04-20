extends CharacterBody3D


const SPEED = 7
const JUMP_VELOCITY = 8

var gravity = 20

@onready
var camera_pivot: Marker3D = $CameraPivot

@onready
var ray_cast: RayCast3D = $CameraPivot/RayCast3D

@onready 
var ideal_target_position: Marker3D = $CameraPivot/IdealTargetPosition

var target_object: Node3D = null

var target_object_snapshot = null

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta):
	_save_target_object_trasnform()
	
	if not is_on_floor():
		velocity.y -= gravity * delta
	elif Input.is_action_just_pressed("ui_accept"):
		velocity.y += JUMP_VELOCITY

	
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
	_update_target_object()
	
	

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		_handleMouseMotion(event)
	
	if event is InputEventMouseButton:
		_handleMouseClick(event)
		
func _handleMouseMotion(event: InputEventMouseMotion):
	var multiplier = 1.0/500.0
		
	var change = event.relative * multiplier

	_save_target_object_trasnform()
	
	camera_pivot.rotate(Vector3(1, 0, 0), -change.y)	
	rotate(Vector3(0, 1, 0), -change.x)	
	
	_update_target_object()
	
func _save_target_object_trasnform():
	if target_object == null:
		return
		
	target_object_snapshot = target_object.global_transform
		
func _update_target_object():
	if target_object == null:
		return
		
	target_object.global_transform = ideal_target_position.global_transform	
	
	var would_collide_now = target_object.move_and_collide(Vector3.ZERO, true)
	
	if would_collide_now:
		pass
		target_object.global_transform = target_object_snapshot
		
	
	
	
	
func _handleMouseClick(event: InputEventMouseButton):
	if event.pressed:
		
		var collider = ray_cast.get_collider()
		
		if collider == null:
			return
		
		print("Picking object", collider)
			
		target_object = collider
		
		

