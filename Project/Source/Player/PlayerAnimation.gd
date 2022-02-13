extends AnimatedSprite

func _on_Player_animate(velocity) -> void:
	if velocity.x < 0:
		play("walk")
		flip_h = true
	elif velocity.x > 0:
		play("walk")
		flip_h = false
	elif velocity.y > 0:
		play("walk")
		flip_h = false
	elif velocity.y < 0:
		play("up")
	else:
		play("idle")

