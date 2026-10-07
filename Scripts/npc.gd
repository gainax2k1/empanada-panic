extends StaticBody2D


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_select"):
		print("npc is action just pressed")
