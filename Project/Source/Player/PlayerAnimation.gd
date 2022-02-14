extends AnimatedSprite

onready var punch = $PunchHit



func _on_Player_animate(velocity) -> void:
	if velocity.x < 0:
		play("walk")
		flip_h = true
		punch.scale.x = scale.y * -1
	elif velocity.x > 0:
		play("walk")
		flip_h = false
		punch.scale.x = scale.y * 1
	elif velocity.y > 0:
		play("walk")
		flip_h = false
	elif velocity.y < 0:
		play("up")
	else:
		play("idle")
