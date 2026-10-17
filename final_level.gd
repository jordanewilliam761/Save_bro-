extends Node2D

@export var level_music: AudioStream

func _ready():
	MusicManager.play_music(level_music)
