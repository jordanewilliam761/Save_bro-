extends Node2D

@export var frist_level_music: AudioStream

func _ready():
	MusicManager.play_music(frist_level_music)
