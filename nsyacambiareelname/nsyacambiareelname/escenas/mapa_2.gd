extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ContoladorMap1.set_keys_label($KeyCounter/Label)
	ContoladorMap1.set_game_over_label($GameOver)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
