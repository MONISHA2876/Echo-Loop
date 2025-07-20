extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += ProjectSettings.get("physics/2d/default_gravity") * delta


	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	#Get the input directions : -1, 0, 1
	var direction := Input.get_axis("moveLeft", "moveRight")
	
	#Flips the sprite
	if direction > 0 :
		animated_sprite.flip_h = true
	elif direction < 0 :
		animated_sprite.flip_h = false
		
	#Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("Idle")
		else :
			animated_sprite.play("run")
	else:
		animated_sprite.play("Idle")
		
		
	
	
	
	#Applies the movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
func _ready():
	add_to_group(	"player")
