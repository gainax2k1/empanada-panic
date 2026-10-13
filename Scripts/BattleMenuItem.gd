extends Resource

class_name BattleMenuItem

@export var BM_Label : Array[String] = [] ## Menu item label name, [0] == ENG, [1] == ESP, etc
@export var BM_Action : Array[String] = [] ## Action (text for dialog) when selected, [0] == ENG, [1] == ESP, etc
@export var BM_Success : bool = false ## Bool for whether item results in success (true) or fail (false)

## BM_Result : Array[String] = [] ## Text for when victory is reached, [0] == ENG, [1] == ESP, etc
