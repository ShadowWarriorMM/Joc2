extends RichTextLabel

@onready var Saltat=0
@onready var Pots=0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Atacar") and Saltat==0 and Pots==1:
		visible=false
		$"../Explicacio_bloqueig".visible=true
		Saltat+=1
	


func _on_timer_timeout():
	Pots=1
