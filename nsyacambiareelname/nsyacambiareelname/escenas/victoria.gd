extends Node2D

@onready var animated_sprite = $Aparicion
@onready var camara = $Camera2D  # Asegúrate de que la ruta sea correcta

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite.play("idle")
	$Button.visible = false
	ContoladorMap1.set_button($Button)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	$Aparicion.move()

func _on_area_cam_body_entered(body: Node2D) -> void:
	print("WOOO PORTAL")
	if body.is_in_group("player"):
		$Personaje.quietoo()
		camara.make_current()
		camara.mover_camara()  # Llama a la función de la cámara cuando el jugador entra


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/menu.tscn")
