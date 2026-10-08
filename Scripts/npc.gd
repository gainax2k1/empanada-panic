extends StaticBody2D

class_name NPC

@export var NPC_dialog_didxs : Array[String] = [] ## Array of String of didx for NPC, like "NPC_001" etc
var NPC_didx : int = 0 ## index of current npc_dialog in npc_dialog_didxs array

@export var can_interact : bool = true ## bool if npc can interact

func _process(delta: float) -> void: ## auto-sets dialogmanager.current_dialog_didx when hero enters area.
	if Input.is_action_just_pressed("ui_select") and can_interact:
		if NPC_dialog_didxs != null:
			var didx = get_idx()
			DialogManager.NPC_current_dialog_didx = didx  
			print("npc is action just pressed, didx: ", didx)

func get_idx() -> String: ##  Serves current npc didx from npc_didxs array, like "NPC_001"
	# npc_Dialog should be like ["NPC_001", "NPC_025"]
	# so, where/when do i iterate to the next dialog ..?
	print("npcdialogdidxs: ", NPC_dialog_didxs)
	if NPC_dialog_didxs != null:
		return NPC_dialog_didxs[NPC_didx]
	return ""
	
func iterate_idx() -> void: ## iterates NPC idx array idx to tee-up next didx
	if NPC_didx +1 < NPC_dialog_didxs.size():
		NPC_didx += 1
	else:
		print("iterate_idx called, but max idx hit")
