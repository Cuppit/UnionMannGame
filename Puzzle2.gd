extends Node







# Called when the node enters the scene tree for the first time.
func _ready():
	$Switch.connected_object = $Door
	$Door.d_hinge = $Hinge

	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
