extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var d_hinge = null # The "hinge" object this door pivots off of 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func run_interaction(param):
	#rotate(1.0)
	if param == false:
		
		# "close" the door
		position = d_hinge.position + (position - d_hinge.position).rotated(-PI/2)
		look_at(d_hinge.position)
		$DoorClose.play()
	else:
		# "open" the door
		position = d_hinge.position + (position - d_hinge.position).rotated(PI/2)
		look_at(d_hinge.position)
		$DoorOpen.play()
		
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
