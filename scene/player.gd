extends CharacterBody2D

@onready var tap: AudioStreamPlayer2D = $tap
@onready var jump: AudioStreamPlayer2D = $Jump
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var footstep_timer: Timer = $FootstepTimer

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
const DOUBlE_JUMP_VELOCITY = -200.0

var MAX_JUMP = 0
var spawn_point: Vector2


func _ready() -> void:
	footstep_timer.timeout.connect(_on_footstep_timeout)
	spawn_point = global_position
	add_to_group("player")


func _on_footstep_timeout() -> void:
	tap.play()


func set_spawn_point(pos: Vector2) -> void:
	spawn_point = pos


func respawn() -> void:
	global_position = spawn_point
	velocity = Vector2.ZERO
	$PlayerLabel.modulate = Color.WHITE


func die() -> void:
	$PlayerLabel.modulate = Color.FIREBRICK


func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		MAX_JUMP = 0

	# Jump / Double Jump
	if Input.is_action_just_pressed("Jump") and MAX_JUMP < 2:
		MAX_JUMP += 1
		if MAX_JUMP == 1:
			velocity.y = JUMP_VELOCITY
			jump.play()
		else:
			velocity.y = DOUBlE_JUMP_VELOCITY
			jump.play()

	# Movement input
	var direction := Input.get_axis("left_move", "right_move ")

	# Flip sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	# Walking check
	var walking := is_on_floor() and direction != 0

	# Footstep timer
	if walking:
		if footstep_timer.is_stopped():
			footstep_timer.start()
	else:
		footstep_timer.stop()

	# Animation
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("Idle")
			tap.stop()
		else:
			animated_sprite.play("Run")
	
	if not is_on_floor() and MAX_JUMP == 1:
		animated_sprite.play("hop")
	elif MAX_JUMP == 2:
			animated_sprite.play("Jump")

	# Movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
