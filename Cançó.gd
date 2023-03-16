extends AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var Un_cop=0
	if $"..".Inici==1 and Un_cop==0:
		$".".play()
		Un_cop+=1



