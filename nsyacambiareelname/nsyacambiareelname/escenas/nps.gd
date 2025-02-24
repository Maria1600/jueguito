extends Node2D

@onready var animated_sprite = $mago  # Obtiene el nodo de animación
@onready var animated_spriteB = $bruja  # Obtiene el nodo de animación
@onready var animated_spriteS = $Survive  # Obtiene el nodo de animación
@onready var animated_spriteA = $Aparicion  # Obtiene el nodo de animación
@export var dialogue_resource: DialogueResource

# Variables para gestionar el estado del diálogo
var has_passed_test: bool = false
var dialogue_shown: bool = false
var dialogue_bruja: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite.flip_h = true
	animated_sprite.play("new_animation_2")
	animated_spriteB.play("default")
	animated_spriteS.play("default")
	animated_spriteA.play("idle")
	# Conectar la señal de respuesta del diálogo
	var dialogue_manager = get_tree().root.get_node("/root/DialogueManager") 
	dialogue_manager.connect("answer_selected", Callable(self, "_on_answer_selected"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if not has_passed_test:
			if not dialogue_shown:
				DialogueManager.show_example_dialogue_balloon(load("res://dialogos/dialogue.dialogue"), "start")
				dialogue_shown = true  # Evitar mostrar el diálogo nuevamente
				check_answer()
			else:
				pass
		else:
			pass

# Método para manejar las respuestas correctas
func check_answer():
	if ContoladorMap1.buenas_respuestas >= 2:
		has_passed_test = true  # Marca que el jugador ha pasado el test

func _on_tope_body_entered(body: Node) -> void:
	if has_passed_test:
		queue_free()


func _on_areabruja_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if not dialogue_bruja:
			DialogueManager.show_example_dialogue_balloon(load("res://dialogos/dialogueBruja.dialogue"), "start")
			dialogue_bruja = true
			get_parent().Habilita_plataformas()
		else:
			pass
