extends Node2D

@export var frist_level_music: AudioStream
@export var music_volume_db: float = 0.0

func _ready():
	MusicManager.play_music(frist_level_music) 
