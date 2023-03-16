extends RichTextLabel

@onready var Saltat=0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Atacar") and Saltat==0:
		visible=false
		$"../Instruccions1".visible=false
		$"../Habilitats".visible=true
		$Timer.start()
		Saltat+=1
		
		
