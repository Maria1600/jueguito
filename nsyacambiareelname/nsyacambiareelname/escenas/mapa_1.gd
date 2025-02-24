extends Node2D

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.show_example_dialogue_balloon( load("res://dialogos/map1Dialogue.dialogue"), "start" )
	$GameOver.visible = false
	ContoladorMap1.set_game_over_label($GameOver)
	ContoladorMap1.set_keys_label($KeyCounter/Label)
	ContoladorMap1.set_audio_key($KeyAudio)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
