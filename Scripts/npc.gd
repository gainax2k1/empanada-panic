extends StaticBody2D

class_name NPC

@export var npc_dialog_didxs : Array[String] = [] ## Array of String of didx for NPC, like "NPC_001" etc
var npc_prev_didx : int = 0 ## index of previous npc_dialog in npc_dialog_idxs

@export var can_interact : bool = true ## bool if npc can interact

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_select") and can_interact:
		if npc_dialog_didxs != null:
			var didx = get_idx()
			DialogManager.current_dialog_didx = didx  
			print("npc is action just pressed, didx: ", didx)

func get_idx() -> String: ##  npc didx should be like "NPC_001"
	# Maybe need to iterate npc prev idx here? 
	# - needs to happen SOMEWHERE
	# npc_Dialog should be like ["NPC_001", "NPC_025"]
	# so, where/when do i iterate to the next dialog ..?
	print("npcdialogdidxs: ", npc_dialog_didxs)
	if npc_dialog_didxs != null:
		return npc_dialog_didxs[npc_prev_didx]
	return ""
