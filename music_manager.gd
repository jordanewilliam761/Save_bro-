extends Node2D

@onready var player = $AudioStreamPlayer

func play_music(music: AudioStream, volume_db: float = 100.0):
	if player.stream == music:
		AudioServer.set_bus_volume_db(0, 100)
		return # already playing, don't restart
	player.stream = music
	player.volume_db = volume_db
	player.play()
