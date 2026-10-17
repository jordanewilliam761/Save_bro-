extends Area2D

func _on_body_entered(body: Node2D) -> void:
	var player = body

	# Handle child nodes
	if not player.has_method("set_spawn_point") and player.get_parent():
		player = player.get_parent()

	if player.has_method("set_spawn_point"):
		player.set_spawn_point(global_position)
		print("Checkpoint set:", global_position)
