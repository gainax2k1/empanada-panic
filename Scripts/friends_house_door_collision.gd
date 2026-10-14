extends CollisionShape2D

func _on_friends_house_door_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	print("enter friends house triggered")
	##something somehting game manager translocate herocat to outside friends house door
	GameManager.change_scene("res://Scenes/friends_house.tscn")
