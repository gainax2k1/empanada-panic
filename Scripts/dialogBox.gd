extends Control

func RunDialog(didx: String) -> void: ## REcieves didx:String, calls dialogmanager and set's dialog to didx
	DialogManager.set_dialogue(didx)	
	var current_line = DialogManager.NPC_current_dialog_line
	putText(current_line.SPKR_Line[DialogManager.LANG])
	
func BattleAction() -> void:
	var txt = BattleManager.get_line()
	putText(txt)
	
	
func putText(RTText : String) -> void: ## Takes RichText string and sends to dialog box text window
	%RTBox.visible = true	
	%RTBox.text = RTText

func toggleDiagBox() -> void: ## Toggles dialogbox visibility, UNNECCESSARY???
	%RTBox.visible = !%RTBox.visible
	
