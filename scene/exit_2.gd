extends Area2D

var entered = false


func _on_body_entered(_body) -> void:
	entered = true


func _on_body_exited(_body) -> void:
	entered = false  


func _process(_delta):
	if entered == true:
		if Input.is_action_just_pressed("Interact"):
			TranstionScene.transition()
			await TranstionScene.on_transition_finished
			get_tree().change_scene_to_file("res://scene/level_three.tscn")
