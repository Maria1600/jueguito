extends Node2D

@onready var animated_spritez = $Zorro
@onready var animated_spriteH = $Herrero
@onready var animated_spriteS1 = $Soldado1
@onready var animated_spriteS2 = $Soldado2
@onready var animated_spriteT = $Tia
@onready var animated_spriteP = $perro
@onready var animated_spritePL = $Paloma
@onready var animated_spriteG = $Gato
@onready var animated_spriteR = $Rata
@onready var animated_spriteHR = $Hermano



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_spriteG.play("default")
	animated_spritez.play("default")
	animated_spriteH.play("default")
	animated_spriteS1.play("default")
	animated_spriteS2.play("default")
	animated_spriteS2.flip_h = true
	animated_spriteT.play("default")
	animated_spritePL.play("default")
	animated_spritePL.flip_h = true
	animated_spriteR.play("default")
	animated_spriteR.flip_h = true
	animated_spriteHR.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
