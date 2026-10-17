extends Area2D

@onready var bro: AnimationPlayer = $"brother talk/AnimationPlayer"


var entered = false


func _on_body_entered(_body) -> void:
	entered = true


func _on_body_exited(_body) -> void:
	entered = false 




func _process(_delta):
	if entered == true:
		print("something entered")
		bro.play("bro talk")
