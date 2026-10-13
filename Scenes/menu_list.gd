extends ItemList


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_names()
	
func set_names() ->void:
	var names = BattleManager.get_menu_names()
	clear()
	for MI in names:
		add_item(MI, null, true)
