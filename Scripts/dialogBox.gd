extends Node

func RunDialog(didx: String) -> void: ## REcieves didx:String, calls dialogmanager and set's dialog to didx
	DialogManager.set_dialogue(didx)	
	var current_line = DialogManager.NPC_current_dialog_line
	putText(current_line.SPKR_Line[DialogManager.LANG])
	
func BattleAction() -> void:
	var txt = BattleManager.get_line()
	
	putText(txt)
	if BattleManager.is_victory:
		victory(BattleManager.BAT_victory)
	
	
func putText(RTText : String) -> void: ## Takes RichText string and sends to dialog box text window
	%RTBox.visible = true	
	%RTBox.text = RTText

func toggleDiagBox() -> void: ## Toggles dialogbox visibility, UNNECCESSARY???
	%RTBox.visible = !%RTBox.visible
	
func victory(victory_text : String) -> void:
	## add pause? something to continue next action. maybe click/spacebar to continue event
	##  llook at hero-cat's signal for interaction....
	
	putText(victory_text)
	
