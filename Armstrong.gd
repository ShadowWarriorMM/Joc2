extends CharacterBody2D

var Desplacament= Vector2.ZERO 
var Moviment= Vector2.ZERO 
var Gravetat= Vector2.DOWN*250
var Velocitat=270
var Salt= 300
var Vides2:=3
var Curacio=0
@onready var Anim_sprite= $Spritesheet2 
@onready var Puny= get_node("Puny1/Puny2")
@onready var Area_inmortalitat= get_node ("Area_inmortal/Area_inmortal2")
@onready var Area_inmortalitat2= get_node ("Area_inmortal3/Area_inmortal4")
@onready var Area_inmortalitat3= get_node ("Area_inmortal5/Area_inmortal6")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func _process(delta):
	Desplacament.x=0
	Moviment.x=0
	
	if Input.is_action_pressed("Ataca2"):
		Puny.disabled=false
		Area_inmortalitat.disabled=true
		Area_inmortalitat2.disabled=true
		Area_inmortalitat3.disabled=true
		Anim_sprite.play ("Ataca")
	if Input.is_action_pressed("Ataca2")==false:
		Puny.disabled=true
	
	if Input.is_action_just_released("Ataca2"):
		Anim_sprite.stop() 
	if Input.is_action_pressed("Esquerra2"):
		Desplacament+=Vector2.LEFT
		Puny.disabled=true
		Area_inmortalitat.disabled=true
		Area_inmortalitat2.disabled=true
		Area_inmortalitat3.disabled=true
		if  (Input.is_action_pressed("Ataca2")):
			Anim_sprite.play ("Ataca")
		else:
			Anim_sprite.play ("Camina")
			
	if Input.is_action_just_released("Esquerra2"):
		Anim_sprite.stop()
		
	if Input.is_action_pressed("Dreta2"):
		Desplacament+=Vector2.RIGHT
		Puny.disabled=true
		Area_inmortalitat.disabled=true
		Area_inmortalitat2.disabled=true
		Area_inmortalitat3.disabled=true
		if  (Input.is_action_pressed("Ataca2")):
			Anim_sprite.play ("Ataca")
		else:
			Anim_sprite.play ("Camina")
	if Input.is_action_just_released("Dreta2"):
		Anim_sprite.stop()
	
	if ((Input.is_action_pressed("Salta2")) or ((Input.is_action_pressed("Salta2")) and (Input.is_action_pressed("Dreta2"))) or ((Input.is_action_pressed("Salta2")) and (Input.is_action_pressed("Esquerra2")))) and is_on_floor():
		Moviment.y=-Salt
		Puny.disabled=true
		Area_inmortalitat.disabled=true
		Area_inmortalitat2.disabled=true
		Area_inmortalitat3.disabled=true
		if (Input.is_action_pressed("Ataca2")==false):
			Anim_sprite.play ("Base")
			
			
	if Input.is_action_just_pressed("Cura"):
		if 	Curacio==0:
			Area_inmortalitat.disabled=false
			Area_inmortalitat2.disabled=false
			Area_inmortalitat3.disabled=false
			Anim_sprite.play ("Cura")
			Vides2+=2
			print ("El jugador 2 s'ha curat, i ara té ", Vides2, " vides")
			Curacio+=1
		else:
			pass
	
		
		
		
	

	Moviment+=Desplacament.normalized()*Velocitat
	Moviment+=Gravetat*delta
	velocity= Moviment
	move_and_slide()
	
	actualitza_direccio(velocity)
	
	

func actualitza_direccio (direction):
	Anim_sprite.flip_h= direction.x>0


func _on_area_per_mal_2_area_entered(Espasa):
	if Input.is_action_just_pressed("Cura"):
		pass
	else:
		Vides2-=1
		print ("Al jugador 2 li queden ",Vides2, " vides")
