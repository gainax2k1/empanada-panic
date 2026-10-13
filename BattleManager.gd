extends Node

@export var BAT_current_didx : String = "" ## Key to BS dictiory (ie, "BAT_1")
@export var BAT_current : BattleInstance = null ## holds current retrieved battle instance
@export var BAT_round_max : int = 0 ## Number of rounds in this battle
@export var BAT_round_idx : int = 0 ## Current round in battle, array of BattleMenu
@export var BAT_menu : BattleMenu = null ## Holds current menu
@export var BAT_menu_max : int = 0 ## number of options in menu

var LANG = 0 ## lang index for dialog/battle strings, 0 = eng, 1 = esp, etc. Get's from DialogManager when battle set

@onready var BS = load("res://Scripts/full_battle_script.tres") ## Full Battle Script

func set_battle(didx: String) -> void:
	LANG = DialogManager.LANG
	
	if didx in BS.BatScript:
		print("didx found in BS: ", didx)
		BAT_current_didx = didx
		BAT_round_idx = 0
		BAT_current = _get_battle_instance()
		BAT_round_max = BAT_current.size() - 1
	
	else: 
		print("didx not found: ", didx)
	
func _get_battle_instance(didx:String = "") -> BattleInstance:
	print("_get_battle_instance: ", didx)
	return BS.BatScript.get(didx)
	
func get_victory_text() -> String:
	return BAT_current.BattleVictoryText[LANG]

func _get_round(idx:int = 0) -> BattleMenu: ## retrieves battleMenu by index
	return null
	return BAT_current.BattleRound[idx]
	
