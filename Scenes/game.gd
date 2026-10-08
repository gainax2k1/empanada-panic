extends Node2D

func _ready() -> void: ## Autostarts menu titlescreen
	GameManager.change_scene("res://Scenes/menu.tscn")
	
