extends CollisionShape2D

func _on_shop_door_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	GameManager.change_scene("res://Scenes/battle.tscn")
