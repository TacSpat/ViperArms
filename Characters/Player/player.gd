extends CharacterBody3D

@onready var camera = $Camera3D

const SPEED = 4.0
var pressed_inputs = Vector2.ZERO
var in_ui = false
func _ready() -> void:
	$Inventory.hide()
	
func _physics_process(delta: float) -> void:
	if !in_ui:
		movement()
	ui_inputs()
	

func ui_inputs():
	if Input.is_action_just_pressed("Inventory"):
		$Inventory.visible = !$Inventory.visible
		in_ui = $Inventory.visible
			
	if Input.is_action_just_pressed("ui_accept"):
		if $Inventory.visible:
			$Inventory.select_focused()
	
func movement():
	var direction = -Input.get_vector("Left", "Right", "Up", "Down")
	if direction:
# stop diagonal movement by listening for input then setting axis to zero
		if Input.is_action_pressed("Right") || Input.is_action_pressed("Left"):
			direction.y = 0
		elif Input.is_action_pressed("Up") || Input.is_action_pressed("Down"):
			direction.x = 0
		else:
			direction = Vector2.ZERO
		pressed_inputs = direction
		$MovementTree.set("parameters/blend_position",Vector2(-pressed_inputs.x, pressed_inputs.y))
	else:
		$MovementTree.set("parameters/blend_position",Vector2(-pressed_inputs.x / 3, pressed_inputs.y / 3))
	
	

	velocity = Vector3(direction.x,0,direction.y).normalized() * SPEED
	if !is_on_floor():
		velocity.y += -9.8
	camera.position.x = lerpf(camera.position.x, direction.x * 0.25, 0.1)
	camera.position.z = lerpf(camera.position.z, direction.y * 0.25, 0.1)
	
	move_and_slide()
