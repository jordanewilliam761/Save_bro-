extends Node2D


func _ready():
	print("ready")
	$Area2D.body_shape_entered.connect(talk)
	
	
func talk(body):
	print("hello", body.name)
