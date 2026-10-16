extends Resource

class_name BattleInstance

@export var EnemySprite : String = "res://Graphics/Battle/shop-cat-battle.png" ## sprite for "enemy"
@export var BattleStart : Array[String] ## Text to display at battle start, [0] == Eng, [1] == ESP, etc...
@export var BattleRound : Array[BattleMenu] ## Each element of array is a battle round
@export var BattleVictoryText : Array[String] ## Text to display upon victory, [0] == Eng, [1] == ESP, etc...
