extends CharacterBody3D


const SPEED = 7
const JUMP_VELOCITY = 8

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 20

@onready
var camera_pivot = $CameraPivot

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
	

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		
		var multiplier = 1.0/500.0
		
		var change = event.relative * multiplier
		
		# var axis = Vector3(0, 0, 1) * change.x
		
		# transform.basis = transform.basis.rotated(axis, 1)
		
		# transform.basis = transform.basis.rotated(Vector3(0, 1, 0), -change.x)
		
		
		camera_pivot.rotate(Vector3(1, 0, 0), -change.y)
		
		rotate(Vector3(0, 1, 0), -change.x)
		
