extends CollisionShape2D

func _on_shop_door_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	BattleManager.set_battle("BAT_1")
	print("bm set to BAT_1 in collision")
	GameManager.change_scene("res://Scenes/battle.tscn")
