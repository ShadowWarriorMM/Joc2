extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Comença"):
		visible=false
		$"../Instruccions1".visible=false
		$"../Instruccions2".visible=false
		$"../Habilitats".visible=false
		$"../Instruccions2".Saltat=1
		$"../Habilitats".Saltat=1	
		$"../Explicacio_bloqueig".visible=false
