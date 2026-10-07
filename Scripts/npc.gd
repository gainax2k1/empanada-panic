extends StaticBody2D

@export var npc_dialog_idxs : Array[String] = [] ## Array of String of didx for NPC, like "NPC_001" etc
@export var npc_prev_didx : int = 0 ## index of previous npc_dialog in npc_dialog_idxs

@export var can_interact : bool = true ## bool if npc can interact

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_select") and can_interact:
		print("npc is action just pressed, do i need this?")
