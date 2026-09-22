extends Node2D

#@onready var game_manager = get_node("GameManager") 

func _ready() -> void:
	GameManager.bg_music_play("")


func _on_option_button_item_selected(index: int) -> void:
	DialogManager.LANG = index
	print("DialogManager LANG: ", index)
	_click_sound()

func _on_quit_buton_pressed() -> void:
	_click_sound()
	get_tree().quit()

func _on_start_button_pressed() -> void:
	_click_sound()
	GameManager.change_scene("res://Scenes/interior.tscn", "TEST_TRANS") # Replace with function body.

func _on_check_button_toggled(toggled_on: bool) -> void:
	_click_sound()
	GameManager.toggle_bg_music()

func _click_sound() -> void:
	$Button_Click.play()
