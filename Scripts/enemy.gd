extends Area2D
@onready var timer: Timer = $Timer
const SPEED = 60
var direction = 1
@onready var ray_cast_2d_right: RayCast2D = $RayCast2DRight
@onready var ray_cast_2d_left: RayCast2D = $RayCast2DLeft
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_2d_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	if ray_cast_2d_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	position.x += SPEED * delta * direction


func _on_body_entered(body):
	print("You died!")
	Engine.time_scale=0.5
	timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale=1
	get_tree().reload_current_scene()
