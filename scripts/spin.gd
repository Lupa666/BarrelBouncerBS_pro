extends CharacterBody3D

@export_range(0.0, 1.0) var mouse_sensitivity = 0.01
@export var tilt_limit = deg_to_rad(75)
@export var SPEED = 2

@onready var camera := $Camera3D;
var target_velocity = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
	
	if event is InputEventMouseMotion:
		rotation.x -= event.relative.y * mouse_sensitivity
		# Prevent the camera from rotating too far up or down.
		rotation.x = clampf(rotation.x, -tilt_limit, tilt_limit)
		rotation.y += -event.relative.x * mouse_sensitivity

# Called every frame. 'delta' is the elapsed time since the previous frame.c
func _process(delta: float) -> void:
	
	pass

func _physics_process(delta: float) -> void:
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		#camera.basis = Basis.looking_at(direction)
	# Ground Velocity
	direction = basis * direction 
	target_velocity.x = direction.x * SPEED
	target_velocity.z = direction.z * SPEED
	# Moving the Character
	velocity = target_velocity
	move_and_slide()
	
	
