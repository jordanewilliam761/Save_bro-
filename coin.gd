extends Area2D

@onready var game_manager: Node = %"Game manager"
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(body):
	game_manager.add_point()
	print("you got a coin!")
	animation_player.play("pickup")
	
