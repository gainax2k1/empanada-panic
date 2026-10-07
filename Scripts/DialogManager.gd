extends Node

@export var current_dialog_didx : String = "" ## key to fs. (ie, "NPC_001")
@export var current_dialog : Dialogue ## Array of dialogue lines
@export var current_dialog_size = 0 ## number of lines at current_dialog 
@export var current_dialog_line_idx : int = 0 ## current_dialog[current_dialog_line_idx]
@export var current_dialog_line : DialogueLine = null ## line has name, icon, line[LANG] (0=eng, 1=esp, etc)

#set/updated by menu.gd
@export var LANG : int = 0 ## LANG = 0 == english, == 1 spanish, etc...

# THIS IS THE LANGUAGE INDEX YOU DOOFUS!!!
# @export var current_line_idx : int = 0

#fs = full_script is a dictionary string:dialogue
@onready var fs = load("res://Scripts/full_dialogue_script.tres")

func set_dialogue(didx: String) -> void:
	if didx in fs:
		print("didx found in fs")
		
	current_dialog_didx = didx
	current_dialog_line_idx = 0
	
	#actually load the dialog by didx from full script
	current_dialog = _get_dialogue() 
	if current_dialog != null:
		current_dialog_size = current_dialog.size()
		print("current dialog size: ", current_dialog_size)
		
		current_dialog_line = _get_line()
		print("new dialogline: ", DialogueLine.new())
		print("current dialog didx: ", current_dialog_didx)
		print("current idx: ", current_dialog_line_idx)
		print("current dialog: ", current_dialog)
		print("current_dialog_size: ", current_dialog_size)
		print("current line: ", current_dialog_line)
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
	return current_dialog_line.SPKR_Name
	
func spkr_icon() -> String:
	return current_dialog_line.SPKR_Icon
	
func spkr_line() -> String:
	return current_dialog_line.SPKR_Line[LANG]

func _get_dialogue() -> Dialogue:
	print("_get_dialogue: ", fs.DScript.get(current_dialog_didx))
	return fs.DScript.get(current_dialog_didx)
	
func _get_line() -> DialogueLine:
	return current_dialog.DialogueLines[current_dialog_line_idx]
	 
func get_lang() -> String: ## returns String from .LANG's int value (0 == eng, 1 == esp, etc)
	if LANG == 0:
		return "ENG"
	elif LANG == 1:
		return "ESP"
	else:
		return "Unknown/Undefined"
