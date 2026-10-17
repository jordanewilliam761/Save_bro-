extends Area2D
@onready var animation_player: AnimationPlayer = $"brother talk/AnimationPlayer"



func _on_body_entered(body):
	print("hello")
	animation_player.play("bro talk")
	
