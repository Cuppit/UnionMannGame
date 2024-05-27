extends Node


signal start_spawning_ghosts

# Called when the node enters the scene tree for the first time.
func _ready():
	$StartMazeSequenceTrigger.connect("start_maze_sequence", self, "_on_Start_Maze_Sequence")
	$Switch5.connected_object = $Door
	$Door.d_hinge = $Hinge
	$SwitchConditional.switches.append($Switch)
	$SwitchConditional.switches.append($Switch2)
	$SwitchConditional.switches.append($Switch3)
	$SwitchConditional.switches.append($Switch4)
	
	$Switch.connected_object = $SwitchConditional
	$Switch2.connected_object = $SwitchConditional
	$Switch3.connected_object = $SwitchConditional
	$Switch4.connected_object = $SwitchConditional
	
	
	
	$SwitchConditional.solution_pattern.append(true)
	$SwitchConditional.solution_pattern.append(true)
	$SwitchConditional.solution_pattern.append(true)
	$SwitchConditional.solution_pattern.append(true)

	$SwitchConditional.connected_object = $Switch5

	pass # Replace with function body.

func _on_Start_Maze_Sequence():
	emit_signal("start_spawning_ghosts")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
