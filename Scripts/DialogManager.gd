extends Node

@export var NPC_current_dialog_didx : String = "" ## key to fs. (ie, "NPC_001")
@export var NPC_current_dialog : Dialogue ## Array of dialogue lines
@export var NPC_current_dialog_size = 0 ## number of lines at NPC_current_dialog 
@export var NPC_current_dialog_line_idx : int = 0 ## current_dialog[current_dialog_line_idx]
@export var NPC_current_dialog_line : DialogueLine = null ## line has name, icon, line[LANG] (0=eng, 1=esp, etc)

#set/updated by menu.gd
@export var LANG : int = 0 ## LANG = 0 == english, == 1 spanish, etc...

# THIS IS THE LANGUAGE INDEX YOU DOOFUS!!!
# @export var current_line_idx : int = 0

#fs = full_script is a dictionary string:dialogue
@onready var NPC_fs = load("res://Scripts/full_dialogue_script.tres")

func set_dialogue(didx: String) -> void:
	if didx in NPC_fs:
		print("didx found in fs")
		
	NPC_current_dialog_didx = didx
	NPC_current_dialog_line_idx = 0
	
	#actually load the dialog by didx from full script
	NPC_current_dialog = _get_dialogue() 
	if NPC_current_dialog != null:
		NPC_current_dialog_size = NPC_current_dialog.size()
		print("current dialog size: ", NPC_current_dialog_size)
		
		NPC_current_dialog_line = _get_line()
		print("new dialogline: ", DialogueLine.new())
		print("current dialog didx: ", NPC_current_dialog_didx)
		print("current idx: ", NPC_current_dialog_line_idx)
		print("current dialog: ", NPC_current_dialog)
		print("current_dialog_size: ", NPC_current_dialog_size)
		print("current line: ", NPC_current_dialog_line)
		#whatever needs to happen, iterating through array, calling appropriate helper functions for icon, name,etc.

func get_dialog_line() -> DialogueLine:
	#var result = current_dialog_line
	
	#if current_dialog_line_idx+1 > current_dialog_size:
		#failstate
	#	print("invalid dialog line idx")
	#else:
	#	current_dialog_line_idx += 1
	
	return _get_line()

func set_lang(lang:int) ->void: ## sets LANG, which is line idx for translation, 0 = eng, 1 = esp, etc...
	LANG = lang

func spkr_name() -> String:
	return NPC_current_dialog_line.SPKR_Name
	
func spkr_icon() -> String:
	return NPC_current_dialog_line.SPKR_Icon
	
func spkr_line() -> String:
	return NPC_current_dialog_line.SPKR_Line[LANG]

func _get_dialogue() -> Dialogue:
	print("_get_dialogue: ", NPC_fs.DScript.get(NPC_current_dialog_didx))
	return NPC_fs.DScript.get(NPC_current_dialog_didx)
	
func _get_line() -> DialogueLine:
	return NPC_current_dialog.DialogueLines[NPC_current_dialog_line_idx]
	 
func get_lang() -> String: ## returns String from .LANG's int value (0 == eng, 1 == esp, etc)
	if LANG == 0:
		return "ENG"
	elif LANG == 1:
		return "ESP"
	else:
		return "Unknown/Undefined"
