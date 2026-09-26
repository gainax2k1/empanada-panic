extends CharacterBody2D

const SPEED = 100.0

func _physics_process(delta: float) -> void:
	var move_vector: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	velocity = move_vector * SPEED
	
	move_and_slide()
