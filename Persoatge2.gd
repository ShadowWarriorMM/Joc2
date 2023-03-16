extends CharacterBody2D
var Moviment= Vector2.ZERO 
var Gravetat= Vector2.DOWN*250
var Velocitat=260
var Desplacament= Vector2.ZERO
var Salt= 300
var Vides2:=3
var Curacio=0
@onready var Anim_sprite= get_node("Spritesheet")
@onready var Personatge1= $"../Personatge1"
@onready var Puny= get_node("Puny1/Puny2")
@onready var Puny_esquerra= get_node ("Puny2/CollisionShape2D")
@onready var Area_inmortalitat= get_node ("Area_inmortal/Area_inmortal2")
@onready var Area_inmortalitat2= get_node ("Area_inmortal3/Area_inmortal4")
@onready var Area_inmortalitat3= get_node ("Area_inmortal5/Area_inmortal6")
@onready var Contador=0
var Comença=0
var Habilitat=0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _process(delta):
	var Inici=0
	if Input.is_action_just_pressed("Comença") and Inici!=1:
		Comença+=1
		Inici+=1
	if Personatge1.Vides<1:
		Anim_sprite.stop()
	if Vides2>=1 and Curacio!=2 and Personatge1.Vides>=1 and Comença==1:
		Desplacament.x=0
		Moviment.x=0
		
		if Input.is_action_pressed("Ataca2"):
			Puny.disabled=false
			Puny_esquerra.disabled=false
			get_node("Cop").play()
			Anim_sprite.play ("Ataca")
		
		if Input.is_action_just_released("Ataca2"):
			Anim_sprite.stop() 
		if Input.is_action_pressed("Esquerra2"):
			Desplacament+=Vector2.LEFT		
			if  (Input.is_action_pressed("Ataca2")):
				Anim_sprite.play ("Ataca")
			else:
				Anim_sprite.play ("Camina")
				
		if Input.is_action_just_released("Esquerra2"):
			Anim_sprite.stop()
			
		if Input.is_action_pressed("Dreta2"):
			Desplacament+=Vector2.RIGHT			
			if  (Input.is_action_pressed("Ataca2")):
				Anim_sprite.play ("Ataca")
			else:
				Anim_sprite.play ("Camina")
		if Input.is_action_just_released("Dreta2"):
			Anim_sprite.stop()
		
		if ((Input.is_action_pressed("Salta2")) or ((Input.is_action_pressed("Salta2")) and (Input.is_action_pressed("Dreta2"))) or ((Input.is_action_pressed("Salta2")) and (Input.is_action_pressed("Esquerra2")))) and is_on_floor():
			Moviment.y=-Salt
		
			
			if (Input.is_action_pressed("Ataca2")==false):
				Anim_sprite.play ("Base")
				
				
		if Input.is_action_just_pressed("Cura"):
			if 	Curacio==0:
				Area_inmortalitat.disabled=false
				Area_inmortalitat2.disabled=false
				Area_inmortalitat3.disabled=false
				Anim_sprite.play ("Cura")
				get_node("Cura").play()
				Vides2+=3
				print ("El jugador 2 s'ha curat, i ara té ", Vides2, " vides")
				Curacio+=2
				Habilitat+=1
			else:
				pass
		
			


		Moviment+=Desplacament.normalized()*Velocitat
		Moviment+=Gravetat*delta
		velocity= Moviment
		move_and_slide()
		
		actualitza_direccio(velocity)
	else:
		if Vides2<1:
			if Contador<1:
				get_node("Mort").play()
				Anim_sprite.play ("Mor")
				Contador+=1

func actualitza_direccio (direction):
	Anim_sprite.flip_h= direction.x>0

func _on_area_2d_area_entered(area):
	if area.name=="Espasa" or area.name=="Espasa_esquerra":
		Vides2-=1
		get_node("Cop_espasa").play()


func _on_foc_1_static_body_entered(body):
	if body.name=="Personatge2":
		Vides2-=6


func _on_foc_2_static_body_entered(body):
	if body.name=="Personatge2":
		Vides2-=6


func _on_foc_3_static_body_entered(body):
	if body.name=="Personatge2":
		Vides2-=6


func _on_foc_4_static_body_entered(body):
	if body.name=="Personatge2":
		Vides2-=6


func _on_spritesheet_animation_finished():
	Area_inmortalitat.disabled=true
	Area_inmortalitat2.disabled=true
	Area_inmortalitat3.disabled=true
	Puny.disabled=true
	Puny_esquerra.disabled=true
	Curacio=1


func _on_cop_finished():
	Puny.disabled=true
	Puny_esquerra.disabled=true


func _on_power_up_body_entered(body):
		if body.name=="Personatge2" and $"../Power_up".Nombre_aleatori==0:
			if Vides2!=6:
				Vides2+=1
			else:
				pass
			$"../Power_up/Colisió_caixa".disabled= true
			$"../Power_up/Colisió_caixa".visible= false
			$"../Power_up/Colisió_caixa/Cor".visible=false
		if body.name=="Personatge2" and $"../Power_up".Nombre_aleatori==1:
			if Curacio!=0:
				Curacio-=1
			$"../Power_up/Colisió_caixa".disabled= true
			$"../Power_up/Colisió_caixa".visible= false
			$"../Power_up/Colisió_caixa/Habilitat".visible=false
