extends CanvasLayer
signal on_transition_finished

@onready var color_rect = $ColorRect
@onready var Animation_player = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	color_rect.visible =  false
	Animation_player.animation_finished.connect(_on_animation_finished)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_animation_finished(anim_name):
		if anim_name == "Fade to Black":
			on_transition_finished.emit()
			Animation_player.play("Fade out")
		elif anim_name == "Fade out": 
			color_rect.visible = false
		
func transition():
	color_rect.visible = true
	Animation_player.play("Fade to Black")
