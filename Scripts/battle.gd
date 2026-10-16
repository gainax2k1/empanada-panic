extends Node2D

var battle_suffix_didx : int = 0 ## Index suffix for dialog manager/script didx
var battle_prefix_didx : String = "BAT_" ## Index prefix for dialog manager/script didx
var battle_didx : String = ""
var current_battle_dialogue_size : int = 0 ## Size of current dialog, might be unneccessary


func get_enemy() -> void:
	pass

func run_turn() -> void:
	pass
	
func narrate_text() -> void:
	pass

func _on_item_list_item_selected(index: int) -> void: ## recieves the index of menu item selected
	_click_sound()
	print("index clicked: ", index)
	BattleManager.set_menu_idx(index)
	$DialogBox.BattleAction() ## Pulls and displays menu choice (atk, magic, etc)
	
func _click_sound() -> void:
	$Button_Click.play()


func _on_tree_entered() -> void:
	GameManager.bg_music_play("res://Audio/Music/battle.ogg")
