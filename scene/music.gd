extends Node2D

@onready var player = $AudioStreamPlayer

func play_music(music: AudioStream):
	if player.stream == music:
		return # already playing, don't restart
	player.stream = music
	player.play()
