extends Control

func _on_option_button_item_selected(language_index: int) -> void:
	DialogManager.set_lang(language_index)
	print("DialogManager LANG: ", DialogManager.get_lang())
	_click_sound()

func _on_music_toggle_toggled(toggled_on: bool) -> void:
		_click_sound()
		GameManager.toggle_bg_music()

func _click_sound() -> void:
	$Button_Click.play()
