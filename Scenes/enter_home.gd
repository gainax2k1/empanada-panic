extends CollisionShape2D


func _on_home_door_body_entered(body: Node2D) -> void:
	print("enter home triggered")
	GameManager.change_scene("res://Scenes/interior.tscn")
