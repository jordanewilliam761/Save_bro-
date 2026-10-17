extends Area2D

@onready var timer: Timer = $Timer
var dead_player: CharacterBody2D = null

func _on_body_entered(body: Node2D) -> void:
	var player = body

	# If it's a child node, go to parent
	if not player.has_method("die") and player.get_parent():
		player = player.get_parent()

	if player.has_method("die"):
		print("You Died!")
		Engine.time_scale = 0.5
		player.die()
		dead_player = player
		timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	if dead_player:
		dead_player.respawn()
		dead_player = null
