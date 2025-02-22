extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -400.0
const gravity = 980.0
var initial_position: Vector2  # Variable para guardar la posición inicial
@onready var animated_sprite = $AnimatedSprite2D2  # Obtiene el nodo de animación
var last_direction = 1  # 1 = Derecha, -1 = Izquierda (por defecto derecha)
var llaves_recogidas: int = 0  # Variable para almacenar la cantidad de llaves recogidas
@export var dialogue_resource: DialogueResource

func _ready():
	initial_position = position  # Guarda la posición inicial

func _physics_process(delta: float) -> void:
	# Aplicar gravedad
	if not is_on_floor():
		velocity.y += gravity * delta  

	# Movimiento izquierda/derecha
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		last_direction = direction  # Guardar la última dirección
		if direction < 0:
			animated_sprite.play("walkLeftDown")
		else:
			animated_sprite.play("walkRightDown")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)  # Suaviza el frenado
		if last_direction < 0:
			animated_sprite.play("idleLeftDown")
		else:
			animated_sprite.play("idleRightDown")

	# Salto
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Aplicar movimiento
	move_and_slide()

func suma_llave():
	llaves_recogidas += 1

func _on_portal_area_body_entered(body: Node2D) -> void:
	print("WOOO PORTAL")
	if body.is_in_group("player"):  # Verifica si el cuerpo es el jugador
		if llaves_recogidas == 1:
			print("hheheheheh")  # Verifica si se ha recogido al menos una llave
			get_tree().change_scene_to_file("res://escenas/mapa_2.tscn")  # Cambia a la siguiente escena
		else:
			reset_position()
			DialogueManager.show_example_dialogue_balloon( load("res://dialogos/PortalDialogue.dialogue"), "start" )

func reset_position():
	position = initial_position  # Restaura la posición inicial

func muere():
	print("Me muero")
