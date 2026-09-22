extends Node2D

#music settings
var bg_music_playing : bool = true
var bg_music_track : String = "res://Audio/Music/gloomy_bg.ogg"

#scene transition
var scene_current: String = "res://Scenes/menu.tscn"
var scene_previous : String = "res://Scenes/menu.tscn"
var player_pos_previous : Vector2  # = starting position vector2

#player/game info
var plr_name : String = "Default Name"
var plr_hp : int = 100

#might need reworking depending on how music get's set up...
func bg_music_play(track_name : String) -> void:
	if track_name != "":
		bg_music_track = track_name
	if bg_music_playing:
		$AudioStreamPlayer.stream = load(bg_music_track)
		$AudioStreamPlayer.play()

func toggle_bg_music():
	if bg_music_playing:
		$AudioStreamPlayer.stop()
	else:
		$AudioStreamPlayer.stream = load(bg_music_track)
		$AudioStreamPlayer.play()
	bg_music_playing = !bg_music_playing
	
func change_scene(target_scene : String, trans_effect : String) -> void:
	scene_previous = scene_current
	scene_current = target_scene
	print("Target scene: ", target_scene)
	print("Trans effect: ", trans_effect) #eventually, cool transition?
	print("Take care of preserving player coordinates in player_pos_previous? Not yet!")
	get_tree().change_scene_to_file.call_deferred(scene_current)
	
