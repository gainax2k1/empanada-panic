extends Node2D

@onready var game_manager = get_node("GameManager") 

func interact():
	DialogManager.get_line(1)
