extends Node2D

@onready var platforms = $Plataforma
@onready var collision = $Plataforma/CollisionPolygon2D
@onready var collision2 = $Plataforma2/CollisionPolygon2D
@onready var platform = $Plataforma2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ContoladorMap1.set_keys_label($KeyCounter/Label)
	ContoladorMap1.set_game_over_label($GameOver)
	ContoladorMap1.set_audio_key($KeyAudio)
	platform.visible = false
	platforms.visible = false
	collision2.disabled = true
	collision.disabled = true

func Habilita_plataformas():
	platform.visible = true
	platforms.visible = true
	collision2.disabled = false
	collision.disabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
