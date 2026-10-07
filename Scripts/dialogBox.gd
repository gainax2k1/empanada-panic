extends Control



func RunDialog(didx: String) -> void:
	DialogManager.set_dialogue(didx)	
	var current_line = DialogManager.get_dialog_line()
	putText(current_line.SPKR_Line[DialogManager.LANG])


func putText(RTText : String) -> void:
	%RTBox.text = RTText

func toggleDiagBox() -> void:
	%RTBox.visible = !%RTBox.visible
	
