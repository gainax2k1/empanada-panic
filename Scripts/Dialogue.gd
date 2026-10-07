extends Resource

class_name Dialogue

@export var DialogueLines : Array[DialogueLine] ## Array of DialogueLine, representing one conversation

func size() -> int:
	return DialogueLines.size()
