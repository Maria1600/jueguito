extends Node2D

@onready var animated_sprite = $Npc1
@onready var animated_spriteF = $Fuego
@onready var animated_spriteS = $Seta1
@onready var animated_spriteA = $Aparicion
@onready var animated_spriteC1 = $cat
@onready var animated_spriteC2 = $cat2
@onready var animated_spriteP = $pajarin

func _ready():
	$Npc1.flip_h = true
	$cat.flip_h = true
	$cat2.flip_h = true
	animated_sprite.play("default")  # Reemplaza "idle" con el nombre de la animación
	animated_spriteF.play("default")
	animated_spriteS.play("default")
	animated_spriteA.play("idle")
	animated_spriteC1.play("default")
	animated_spriteC2.play("default")
	animated_spriteP.play("default")
