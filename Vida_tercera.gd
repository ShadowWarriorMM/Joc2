extends AnimatedSprite2D

@onready var Jugador= $".."
@onready var animacions=$"."
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var Vides= Jugador.Vides
	if Vides<3:
		animacions.play("Perd vida")
	if Vides==3:
		animacions.play("Normal")
	
