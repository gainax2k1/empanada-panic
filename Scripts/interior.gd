extends Node2D

@onready var game_manager = get_node("GameManager") 
@onready var dialogue_manager =get_node("/root/DialogManager")

func _ready() -> void:
	DialogManager.set_dialogue("TEST_CONV")

func interact():
	DialogManager.get_line(1)
