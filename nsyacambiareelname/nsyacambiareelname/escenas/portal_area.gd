extends Area2D

@onready var animated_sprite = $Portal

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
