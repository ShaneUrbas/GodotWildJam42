extends KinematicBody2D

export var speed = 200
var velocity = Vector2()
var isAttacking = false

func _physics_process(delta: float) -> void:
	get_input()
	punch()
	velocity = move_and_slide(velocity)

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("left") && isAttacking == false:
		velocity.x -= 1
		$PlayerAnimation.play("walk")
		scale.x = scale.y * -1
	elif Input.is_action_pressed("right") && isAttacking == false:
		velocity.x += 1
		$PlayerAnimation.play("walk")
		scale.x = scale.y * 1
	elif Input.is_action_pressed("up") && isAttacking == false:
		velocity.y -= 1
		$PlayerAnimation.play("up")
	elif Input.is_action_pressed("down") && isAttacking == false:
		velocity.y += 1
		$PlayerAnimation.play("walk")
	else:  
		if isAttacking == false:
			$PlayerAnimation.play("idle")
			
	velocity = velocity.normalized() * speed
	
func punch():
	if Input.is_action_just_pressed("punch"):
		$PlayerAnimation.play("punch")
		isAttacking = true;
		$PlayerAnimation/PunchCollision/CollisionShape2D.disabled = false;

func _on_PlayerAnimation_animation_finished() -> void:
	if $PlayerAnimation.animation == "punch":
		isAttacking = false;
		$PlayerAnimation/PunchCollision/CollisionShape2D.disabled = true;

