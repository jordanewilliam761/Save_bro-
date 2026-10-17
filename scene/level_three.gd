extends Node2D

@export var frist_level_music: AudioStream

func _ready():
	MusicManager.play_music(frist_level_music)


func _on_exit_3_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
