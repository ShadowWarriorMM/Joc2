extends CharacterBody2D

var Desplacament= Vector2.ZERO 
var Moviment= Vector2.ZERO 
var Gravetat= Vector2.DOWN*260
var Velocitat=270
var Salt= 350
var Vides:= 3
var una_vegada=0
var Para_temps=0
var Comença=0
@onready var Espasa= get_node("Spritesheet/Espasa/Area_espasa")
@onready var Espasa_esquerra= get_node ("Spritesheet/Espasa_esquerra/Espasa_esqueeea")
@onready var Personatge2=$"../Personatge2"
@onready var Anim_sprite= $Spritesheet
@onready var Contador=0
@onready var Contador1=0
@onready var Temps_parat=0
var Mort=0
var Fons1= preload ("res://Fons.jpg")
var Fons2=preload ("res://Fotos/Fons_blanc_i_negre.jpg")
var Foc1=preload ("res://Fotos/Foc.png")
var Foc2= preload ("res://Fotos/Foc-modified.png")
@onready var Inici=0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func _process(delta):
	
	if Input.is_action_just_pressed("Comença") and Inici!=1:
		Inici+=1
		Comença+=1
		
	if Personatge2.Vides2<1:
		Anim_sprite.stop()
		
		
	
			
	if Vides>=1 and Temps_parat!=1 and Personatge2.Vides2>=1 and Comença==1:
		Desplacament.x=0
		Moviment.x=0
		
		if Input.is_action_just_pressed("Para_temps") and Contador1!=1:
			Temps_parat=1
			Anim_sprite.play("Temps")
			$Contador.start()
			
		if Input.is_action_just_pressed("Atacar"):
			Anim_sprite.play ("Attack")
			Espasa.disabled=false
			Espasa_esquerra.disabled=false
			get_node("Espasa_treta").play()
			
		if Input.is_action_pressed("Dreta"):
			Desplacament+=Vector2.RIGHT
			if Input.is_action_pressed("Salta")==false and (Input.is_action_pressed("Atacar")==false):
				Anim_sprite.play ("Run")
				actualitza_direccio (velocity)
				
		if Input.is_action_pressed("Esquerra"):
			Desplacament+=Vector2.LEFT
			if  Input.is_action_pressed("Salta")==false and (Input.is_action_pressed("Atacar")==false):
				Anim_sprite.play ("Run")
				actualitza_direccio (velocity)
		
		if ((Input.is_action_pressed("Salta")) or ((Input.is_action_pressed("Salta")) and (Input.is_action_pressed("Dreta"))) or ((Input.is_action_pressed("Salta")) and (Input.is_action_pressed("Esquerra")))) and is_on_floor():
			Moviment.y=-Salt
			if (Input.is_action_pressed("Atacar")==false):
				Anim_sprite.play ("Salt")
			
		if Input.is_action_pressed("Esquerra")==false and Input.is_action_pressed("Dreta")==false and Input.is_action_pressed("Salta")==false and (Input.is_action_pressed("Atacar")==false) and Temps_parat!=1 :
			Anim_sprite.play ("Idle")
		
			
		
			
		Moviment+=Desplacament.normalized()*Velocitat
		Moviment+=Gravetat*delta
		velocity= Moviment
		
		move_and_slide()
	else:
		if Vides<1 and Mort!=1:
			get_node("Mort").play()
			Anim_sprite.play ("Muerte")
			Mort+=1
		else:
			pass
		
	
		
		
func actualitza_direccio (direction):
	Anim_sprite.flip_h= direction.x<0




func _on_area_area_entered(area):
	if area.name=="Puny1" or area.name=="Puny2":
		get_node("Cop_puny").play ()
		Vides-=1
		print ("Al jugador 1 li queden ", Vides," vides")
	

func _on_foc_1_static_body_entered(body):
	if body.name=="Personatge1":
		Vides-=3


func _on_foc_2_static_body_entered(body):
	if body.name=="Personatge1":
		Vides-=3


func _on_foc_3_static_body_entered(body):
	if body.name=="Personatge1":
		Vides-=3


func _on_foc_4_static_body_entered(body):
	if body.name=="Personatge1":
		Vides-=3





func _on_contador_timeout():
	if Contador1!=1:
		get_node("Para_temps").play()
		Contador1+=1
		$"Duració_audio".start()
	
	

func _on_duraci_audio_timeout():
	Temps_parat=0
	get_node("Cançó").volume_db=-3
	$"../Node2D/Paret_esquerra/Fons".set_texture (Fons2)
	$"../Foc".set_texture(Foc2)
	$"../Foc2".set_texture(Foc2)
	$"../Foc3".set_texture(Foc2)
	$"../Foc4".set_texture(Foc2)	
	Personatge2.Curacio=2
	$Duracio_temps_parat.start()

func _on_duracio_temps_parat_timeout():
	var Temps=0
	Temps+=1
	if Temps==1:
		get_node("Resumeix_el_temps").play()
		$"../Node2D/Paret_esquerra/Fons".set_texture (Fons1)
		$"../Foc".set_texture(Foc1)
		$"../Foc2".set_texture(Foc1)
		$"../Foc3".set_texture(Foc1)
		$"../Foc4".set_texture(Foc1)
		get_node("Cançó").volume_db=6
	if Personatge2.Habilitat==0:
		Personatge2.Curacio=0
	else:
		Personatge2.Curacio=1
		
	
func _on_can_finished():
	get_node ("Cançó").play()


func _on_power_up_body_entered(body):
	if body.name=="Personatge1" and $"../Power_up".Nombre_aleatori==0:
		if Vides!=3:
			Vides+=1
		else:
			pass
		$"../Power_up/Colisió_caixa".disabled= true
		$"../Power_up/Colisió_caixa".visible= false
		$"../Power_up/Colisió_caixa/Cor".visible=false
	if body.name=="Personatge1" and $"../Power_up".Nombre_aleatori==1:
		if Contador1!=0:
			Contador1-=1
		$"../Power_up/Colisió_caixa".disabled= true
		$"../Power_up/Colisió_caixa".visible= false
		$"../Power_up/Colisió_caixa/Habilitat".visible=false
		


func _on_espasa_treta_finished():
	Espasa.disabled=true
	Espasa_esquerra.disabled=true
	
