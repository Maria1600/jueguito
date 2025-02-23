extends CharacterBody2D

@export var speed: float = 70.0  # Velocidad del enemigo
@export var left_limit: float = -20.0 # Límite izquierdo (posición relativa)
@export var right_limit: float = 20.0 # Límite derecho (posición relativa)
@onready var animated_sprite = $AnimatedSprite2D2  # Obtiene el nodo de animación
const gravity = 980.0

var direction: int = -1  # 1 = Derecha, -1 = Izquierda
var start_position: Vector2  # Guarda la posición inicial

func _ready():
	start_position = global_position  # Guarda la posición inicial

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta  
	
	# Moverse en la dirección actual
	velocity.x = direction * speed
	
	# Seleccionar la animación correcta en cada frame
	if direction == -1:
		animated_sprite.play("runLeft")
	elif direction == 1:
		animated_sprite.play("runRight")

	# Verificar si llegó a un límite
	if global_position.x > start_position.x + right_limit:
		direction = -1  # Cambia a la izquierda
	elif global_position.x < start_position.x + left_limit:
		direction = 1  # Cambia a la derecha
		
	move_and_slide()

func _on_top_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("somos panas")  # Solo para debug


func _on_lados_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):  # Si el jugador toca los lados o abajo
		body.muere() 
