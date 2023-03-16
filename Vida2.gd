extends AnimatedSprite2D

@onready var Jugador=$".."
@onready var Vides= "Vides"
@onready var Animacions= $"."
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var Vides= Jugador.Vides
	if Vides==1:
		Animacions.play ("Perd vida")
	
