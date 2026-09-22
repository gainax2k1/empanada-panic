extends Node

@export var current_dialog_didx : String = ""
@export var current_dialog : Dialogue
@export var current_dialog_size = 0
@export var current_line : DialogueLine
@export var current_idx : int = 0
@export var LANG : int = 0 #update later, LANG = 0 == english, == 1 spanish, but will be set in game options, so asign from that

#fs = full_script
@onready var fs = load("res://Scripts/full_dialogue_script.tres")

func set_dialogue(didx: String):
	current_dialog_didx = didx
	current_idx = 0
	current_dialog = _get_dialogue()
	current_dialog_size = current_dialog.DialogueLines.size()
	current_line = _get_line()
	print("current dialog didx: ", current_dialog_didx)
	print("current idx: ", current_idx)
	print("current dialog: ", current_dialog)
	print("current_dialog_size: ", current_dialog_size)
	print("current line: ", current_line)
	#whatever needs to happen, iterating through array, calling appropriate helper functions for icon, name,etc.

# TODO: automate "end of dialogue" protocol?
# consider safety checks for dialog size, script size...
func set_lang(lang:int) ->void:
	LANG = lang

func spkr_name() -> String:
	return current_line.SPKR_Name
	
func spkr_icon() -> String:
	return current_line.SPKR_Icon
	
func spkr_line() -> String:
	return current_line.SPKR_Line[LANG]

func _get_dialogue() -> Dialogue:
	return fs.DScript.get(current_dialog_didx)
	#prolly not exactly right, but this is how to=

func _get_line() -> DialogueLine:
	return current_dialog.DialogueLines[current_idx]
	 
