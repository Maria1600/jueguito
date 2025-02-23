extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Controles.visible = false
	$Button4.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/mapa_1.tscn")

func _on_button_2_pressed() -> void:
	get_tree().quit() 

func _on_button_3_pressed() -> void:
	$Button.visible = false
	$Button2.visible = false
	$Button3.visible = false
	$Controles.visible = true
	$Button4.visible = true

func _on_button_4_pressed() -> void:
	$Button.visible = true
	$Button2.visible = true
	$Button3.visible = true
	$Controles.visible = false
	$Button4.visible = false
