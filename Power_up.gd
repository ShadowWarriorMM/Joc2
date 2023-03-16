extends Area2D

@onready var Nombre_aleatori= randi()%2
@onready var Caixa= preload ("res://Fotos/Caixa_misteriosa.png")
@onready var Cor= preload("res://Cor vermell.png")
@onready var Habilitat= preload ("res://Power_up.gd")
var Un_cop=0
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if $"../Personatge1".Comença==1 and Un_cop==0:
		$Temps_spawn.start()
		Un_cop+=1
	
func _on_temps_spawn_timeout():
	if Nombre_aleatori==0:
		$"Colisió_caixa".disabled= false
		$"Colisió_caixa".visible= true
		$"Colisió_caixa/Cor".visible=true
	if Nombre_aleatori==1:
		$"Colisió_caixa".disabled= false
		$"Colisió_caixa".visible= true
		$"Colisió_caixa/Habilitat".visible=true
		
#		
	
	
	
		
		
	
	
