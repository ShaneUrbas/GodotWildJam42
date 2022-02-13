extends KinematicBody2D

export var speed = 200

var velocity = Vector2()

signal animate

func _physics_process(delta: float) -> void:
	get_input()
	animate()
	velocity = move_and_slide(velocity)
	

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	velocity = velocity.normalized() * speed
	
func animate():
	emit_signal("animate", velocity)