extends CollisionShape2D

var meds_taken = false ## Flag for check if meds have been taken

func _on_area_2d_body_entered(body: Node2D) -> void:
		print("meds area entered")
		if Input.is_action_just_pressed("ui_select"):
			if meds_taken:
				print("I already took my meds")
			if !meds_taken:
				print("OH, I should take my meds")
				meds_taken = true
				print("I took my meds")
				%MedGlow.visible = false

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	pass # Replace with function body.
