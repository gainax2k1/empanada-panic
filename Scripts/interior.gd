extends Node2D

@onready var lang : String = DialogManager.get_lang()

func _ready() -> void:
	DialogManager.set_dialogue("TEST_CONV")
	print("assign proper language sign")
	
	if lang == "ENG":
		$WallDecor/MedsReminder.texture = load("res://Graphics/Interior/meds-reminder-eng.png")
	elif lang == "ESP":
		$WallDecor/MedsReminder.texture = load("res://Graphics/Interior/meds-reminder-esp.png")
	else:
		$WallDecor/MedsReminder.texture = load("res://Graphics/Interior/meds-reminder-eng.png")
	

#func interact():
#	DialogManager.get_line(1)
