extends Node2D

#music settings
var bg_music_playing : bool = true ## Set in menu
var bg_music_track : String = "res://Audio/Music/gloomy_bg.ogg" ## string "res:// ...ogg"

#scene transition
var scene_current: String = "res://Scenes/menu.tscn" ## string "res://Scenes/...tcsn"
var scene_previous : String = "res://Scenes/menu.tscn" ## string "res://Scenes/...tcsn"
var player_pos_previous : Vector2  ##  starting position vector2, UNUSED

#
#player/game info
var plr_name : String = "Default Name" ## UNUSED
var plr_hp : int = 100 ## UNUSED

#might need reworking depending on how music get's set up...
func bg_music_play(track_name : String) -> void: ## recieves "res://Audio/Music/...ogg"
	if track_name != "":
		bg_music_track = track_name
	if bg_music_playing:
		$AudioStreamPlayer.stream = load(bg_music_track)
		$AudioStreamPlayer.play()

func toggle_bg_music(): ## toggles , loading current "bg_music_track" if playing.
	if bg_music_playing:
		$AudioStreamPlayer.stop()
	else:
		$AudioStreamPlayer.stream = load(bg_music_track)
		$AudioStreamPlayer.play()
		
	bg_music_playing = !bg_music_playing
	
func change_scene(target_scene : String, trans_effect : String = "Fade") -> void: ##handles scene trans, default to "Fade"
	## target_scene = "res://Scenes/...tscn", trans_effect "Fade", etc
	
	scene_previous = scene_current
	scene_current = target_scene
	
	print("Target scene: ", target_scene)
	print("Trans effect: ", trans_effect) #eventually, cool transition?
	print("Take care of preserving player coordinates in player_pos_previous? Not yet!")

	match trans_effect:
		"Fade":
			print("Fade transition")
			$SceneTransitionRect.transition_to(target_scene)
		_:
			print("Wildcard transition, default Fade")
		
	#get_tree().change_scene_to_file.call_deferred(scene_current)
	
