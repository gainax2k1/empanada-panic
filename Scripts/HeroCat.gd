extends CharacterBody2D

const SPEED = 100.0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_select"):
		print("ui_select pressed")  

func _physics_process(delta: float) -> void:
	move_hero()
	
func move_hero():
	var move_vector: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	velocity = move_vector * SPEED
	
	if velocity.x > 0:
		$HeroCatBig.play("Facing-Right")
	elif velocity.x < 0:
		$HeroCatBig.play("Facing-Left")
	elif velocity.y > 0:
		$HeroCatBig.play("Facing-Down")
	elif velocity.y < 0:
		$HeroCatBig.play("Facing-Up")
	if velocity == Vector2(0,0):
		$HeroCatBig.stop()
	
	move_and_slide()
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("interactable"):
		print("hero-cat body entered for interactable")

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("interactable"):
		print("hero-cat body exited for interactable")
