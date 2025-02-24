extends Area2D

@onready var animated_sprite = $Key
@onready var sound_effect = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):  # Verifica si el jugador tocó la llave
		body.suma_llave() # Aumenta la variable en el jugador
		ContoladorMap1.play_audio_key()
		queue_free()  # Elimina SOLO la llave
