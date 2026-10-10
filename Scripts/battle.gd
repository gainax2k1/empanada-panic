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

func play_success() -> void:
	pass

func play_failure() -> void:
	pass
	
func play_victory() -> void:
	pass

func _on_item_list_item_selected(index: int) -> void:
	_click_sound()
	print("index clicked: ", index)
	battle_didx = battle_prefix_didx + str(battle_suffix_didx)
	print("battle_didx: ", battle_didx)
	$DialogBox.RunBattleDialog(battle_didx)
	$DialogBox.BattleAction(index)
	
func _click_sound() -> void:
	$Button_Click.play()
