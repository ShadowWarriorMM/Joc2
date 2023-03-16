extends AnimatedSprite2D

@onready var Jugador= $".."
@onready var Animacions=$"."
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var Vides= Jugador.Vides2
	if Vides== 6:
		visible=true
	if visible==true:
		if Vides<6:
			Animacions.play ("Perd vida")
