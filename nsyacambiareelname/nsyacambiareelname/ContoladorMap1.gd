extends Node

var game_over
var keys_label
var buenas_respuestas : int = 0
var sound_effect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func set_game_over_label(label_node):
	game_over = label_node  # Guarda la referencia del Label

func set_audio_key(label_node):
	sound_effect = label_node  # Guarda la referencia del Label

func play_audio_key():
	sound_effect.play()

func set_keys_label(key):
	keys_label = key  # Guarda la referencia del Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func good_answer():
	buenas_respuestas += 1
