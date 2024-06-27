extends CharacterBody2D

@onready var anim_sprite = $AnimatedSprite2D;

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get input direction: -1, 0, 1
	var direction = Input.get_axis("move_left", "move_right")

	# Flip the sprite texture
	if direction > 0 :
		anim_sprite.flip_h = false;
	elif direction < 0 :
		anim_sprite.flip_h = true;

	# Play animations
	if is_on_floor() :
		if direction == 0 :
			anim_sprite.play("Idle");
		else :
			anim_sprite.play("Run");
	else :
		anim_sprite.play("Jump");

	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
