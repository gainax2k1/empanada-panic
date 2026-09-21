extends Node

@export var current_dialog : Array[DialogueLine]
@export var current_dialog_size = 0
@export var current_line : DialogueLine
@export var current_idx : int = 0
@export var LANG : int = 0 #update later, LANG = 0 == english, == 1 spanish, but will be set in game options, so asign from that

#fs = full_script
var _full_script = load("res://Scripts/full_dialogue_script.tres")

func set_dialogue(idx: int):
	current_idx = idx
	current_dialog = _get_dialogue()
	current_dialog_size = len(current_dialog)
	current_line = _get_line()
	#whatever needs to happen, iterating through array, calling appropriate helper functions for icon, name,etc.

# TODO: automate "end of dialogue" protocol?
# consider safety checks for dialog size, script size...

func spkr_name():
	return current_line.SPKR_Name
	
func spkr_icon():
	return current_line.SPKR_Icon
	
func spkr_line():
	return current_line.SPKR_Line[LANG]

func _get_dialogue():
	return _full_script.Dialogue[current_idx]
	#prolly not exactly right, but this is how to=

func _get_line() -> DialogueLine:
	return current_dialog[current_idx]
	 
