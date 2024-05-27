extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#The object this switch is connected to (e.g. a door).  
var connected_object = null
var on = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):	
#	pass


# Performs 
func run_interaction(param):
	
	if on:
		on = false
		$AnimatedSprite.animation = "off"
		if (connected_object != null) and (connected_object.has_method("run_interaction")):
			connected_object.run_interaction(false) # Toggling "off" indicated by 'false' bool val.
	else:
		on = true
		$AnimatedSprite.animation = "on"
		if (connected_object != null) and (connected_object.has_method("run_interaction")):
			connected_object.run_interaction(true) # Toggling "on" indicated by 'true' bool val.



func _on_InteractRadius_body_entered(body):
	if body.has_method("interact"):
		#Give the 'interactor' the ability to interact within it's own code
		body.interactee = self
		$Action.visible = true
	pass # Replace with function body.


func _on_InteractRadius_body_exited(body):
	if body.has_method("interact"):
		if body.interactee == self:
			body.interactee = null # De-couple this switch from it's interactor
		$Action.visible = false
	pass # Replace with function body.
