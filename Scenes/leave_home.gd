extends CollisionShape2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Leave home triggered")
	GameManager.change_scene("res://Scenes/overworld.tscn") # Replace with function body.
	pass
