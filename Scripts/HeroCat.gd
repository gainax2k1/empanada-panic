extends CharacterBody2D

const SPEED = 100.0
var can_interact = false
#var target_obj : NPC ## last node that was interactable that hero touched
var didx : String = ""


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_select"):
		print("ui_select pressed in herocat")  
		if can_interact:
			
			# hero-cat actioned to show dialog, needs didx for dialogmanager
			#didx = $target_obj.npc_dialog_indxs[$target_obj.npc_prev_idx]
			$DialogBox.visible = true
			$DialogBox.RunDialog(didx)
			

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
	if body.is_in_group("interactable") and body.can_interact:
		can_interact = true
		didx = body.get_idx()
		print("hero on area didx = ", didx)
		print(body.name)
		print("hero-cat body entered for interactable")

func _on_area_2d_body_exited(body: Node2D) -> void:
	can_interact = false
	$DialogBox.visible = false
	if body.is_in_group("interactable"):
		print("hero-cat body exited for interactable")
