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

var ignore_input = false

var target_object: RigidBody3D = null

signal view_object(target)

func _ready():
	pass

func _physics_process(delta):

	if not is_on_floor():
		velocity.y -= gravity * delta
	elif Input.is_action_just_pressed("ui_accept") and not ignore_input:
		velocity.y += JUMP_VELOCITY

	if not ignore_input:
		var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
		var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func handle_input(event):
	if event is InputEventMouseMotion:
		_handleMouseMotion(event)

	if event is InputEventMouseButton:
		_handleMouseClick(event)

func _handleMouseMotion(event: InputEventMouseMotion):
	if ignore_input:
		return

	var multiplier = 1.0/500.0

	var change = event.relative * multiplier

	camera_pivot.rotate(Vector3(1, 0, 0), -change.y)
	rotate(Vector3(0, 1, 0), -change.x)




func _handleMouseClick(event: InputEventMouseButton):
	if ignore_input:
		return

	if event.pressed:

		if event.button_index == MouseButton.MOUSE_BUTTON_LEFT:
			var collider = ray_cast.get_collider()

			if collider == null or collider == target_object:
				_drop_item()

			elif collider.has_method("assign_target_position"):
				_pick_item(collider)
		elif event.button_index == MouseButton.MOUSE_BUTTON_RIGHT:
			if target_object != null:
				view_object.emit(target_object)


func _pick_item(target: RigidBody3D):
	_drop_item()
	print("Picking object ", target)
	target.assign_target_position(ideal_target_position)
	target_object = target

func _drop_item():
	if target_object != null:
		print("Dropping object", target_object)
		target_object.remove_target_position()
		target_object = null

func drop_current_item():
	_drop_item()
