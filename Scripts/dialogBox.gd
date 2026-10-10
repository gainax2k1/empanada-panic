extends Control


func RunDialog(didx: String) -> void: ## REcieves didx:String, calls dialogmanager and set's dialog to didx
	DialogManager.set_dialogue(didx)	
	var current_line = DialogManager.NPC_current_dialog_line
	putText(current_line.SPKR_Line[DialogManager.LANG])

func RunBattleDialog(didx: String) -> void: ## recieves didx:string, calls dialogmanager to set battle didx, bu DOES NOT pull line automatically
	DialogManager.set_dialogue(didx)
	
func BattleAction(idx : int):
	var current_line = DialogManager.BAT_get_dialog_line(idx)
	putText(current_line.SPKR_Line[DialogManager.LANG])
	
func putText(RTText : String) -> void: ## Takes RichText string and sends to dialog box text window
	%RTBox.text = RTText

func toggleDiagBox() -> void: ## Toggles dialogbox visibility, UNNECCESSARY???
	%RTBox.visible = !%RTBox.visible
	
