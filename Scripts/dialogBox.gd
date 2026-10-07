extends Control



func RunDialog(didx: String) -> void:
	DialogManager.set_dialogue(didx)	
	


func putText(RTText : String) -> void:
	%RTBox.text = RTText

func toggleDiagBox() -> void:
	%RTBox.visible = !%RTBox.visible
	
