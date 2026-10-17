
extends Node

@export var BAT_current_didx : String = "" ## Key to BS dictiory (ie, "BAT_1")
@export var BAT_instance : BattleInstance ## holds current retrieved battle instance
@export var BAT_round_size : int = 0 ## Number of rounds in this battle
@export var BAT_round_idx : int = 0 ## Current round in battle, array of BattleMenu
@export var BAT_menu : BattleMenu ## Holds current menu
@export var BAT_menu_size : int = 0 ## number of options in menu
@export var BAT_menu_idx : int = 0 ## index of menu currently selected, like 0 = talk, 1 = item, etc...
@export var BAT_victory : String = "" ## String of victory text
@export var is_victory : bool = false ## true when victory option chosen from menu

var MenuList : ItemList
var LANG = 0 ## lang index for dialog/battle strings, 0 = eng, 1 = esp, etc. Get's from DialogManager when battle set

@onready var BS = load("res://Scripts/full_battle_script.tres") ## Full Battle Script

func _ready() -> void:
	set_battle("BAT_1")
	
func set_battle(didx: String) -> void:
	print("set_battle: ", didx)
	print("BS: ", BS)
	
	LANG = DialogManager.LANG
	BAT_current_didx = didx
	BAT_instance = _get_battle_instance() ## sets battle instance, with battleround[idx] and battlevictorytext[lang]
	print("BAT_currrent: ", BAT_instance)

	BAT_round_size = BAT_instance.BattleRound.size()
	print("BAT_round_size: ", BAT_round_size)
	
	BAT_round_idx = 0
	BAT_menu = _get_round() ## battleMenu
	print("BAT_MENU from getround: ", BAT_menu)
	#BAT_menu_size = BAT_menu.size()
	#MenuList.
	BAT_victory = _get_victory_text()
	
	
func _get_battle_instance() -> BattleInstance:
	print("_get_battle_instance: ", BAT_current_didx)
	return BS.BatScript.get(BAT_current_didx)

func _get_victory_text() -> String:
	return BAT_instance.BattleVictoryText[LANG]

func _get_round() -> BattleMenu: ## retrieves battleMenu by index
	#BAT_instance.BattleRound[BAT_round_idx].BMenu
	
	print("BAT_instance.BattleRound[BAT_round_idx]: ", BAT_instance.BattleRound[BAT_round_idx])
	print("BAT_instance: ", BAT_instance)
	print("Bat_round_idx: ", BAT_round_idx)
	print("Bat_instance.Battleround: ", BAT_instance.BattleRound)
	return BAT_instance.BattleRound[BAT_round_idx]
	
func set_menu_idx(idx:int) -> void:
	BAT_menu_idx = idx
	
func get_menu_names() -> Array:
	var result = []
	
	for item in BAT_menu.BMenu.size():
		print("item: ", item)
		print("item in getmenunames: ", BAT_menu.BMenu[item])
		print("LANG: ", LANG)
		result.append(BAT_menu.BMenu[item].BM_Label[LANG])
	return result
	
func get_line() -> String:
	is_victory = BAT_menu.BMenu[BAT_round_idx].BM_Success
	if is_victory:

		print("get_line -> Victory is true!")
		print(BAT_victory)
	
	return BAT_menu.BMenu[BAT_round_idx].BM_Action[LANG]

func play_victory() -> void:
	GameManager.bg_music_play("res://Audio/Music/Happy_short.ogg")
