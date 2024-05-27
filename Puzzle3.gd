extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Switch.connected_object = $Door
	$Door.d_hinge = $Hinge
	$SwitchConditional.switches.append($Switch2)
	$SwitchConditional.switches.append($Switch3)
	$SwitchConditional.switches.append($Switch4)
	$SwitchConditional.switches.append($Switch5)
	
	$Switch2.connected_object = $SwitchConditional
	$Switch3.connected_object = $SwitchConditional
	$Switch4.connected_object = $SwitchConditional
	$Switch5.connected_object = $SwitchConditional
	
	
	$SwitchConditional.solution_pattern.append(true)
	$SwitchConditional.solution_pattern.append(false)
	$SwitchConditional.solution_pattern.append(true)
	$SwitchConditional.solution_pattern.append(false)

	$SwitchConditional.connected_object = $Switch

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
