extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


const SPEED = 150.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
# this part checks the direction : -1,0,1
	var direction := Input.get_axis("moveLeft", "moveRight")
	
#this part flip the sprit
	if direction > 0:
		animated_sprite_2d.flip_h= true
	elif direction < 0:
		animated_sprite_2d.flip_h= false

	if direction==0:animated_sprite_2d.play("Idle")
	else :
		animated_sprite_2d.play("run")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
