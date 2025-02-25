extends Camera2D

@export var destino_y: float = -100  # Altura final de la cámara
@export var duracion: float = 14.0  # Duración del movimiento en segundos

func mover_camara():
	print("Moviendo cámara...")
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position:y", destino_y, duracion).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	await get_tree().create_timer(20.0).timeout
	ContoladorMap1.button.visible = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
