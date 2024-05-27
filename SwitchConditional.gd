# Special switch the player doesn't interact with directly; rather, 
# the "main" script adds switches for this to track at creation.
# The "main" script also provides a "solution" pattern.  So that,
# once the switches are in a combination of states in line with 
# the "solution" pattern, this switch will trigger activity in 
# whatever it's pointing to itself.

extends Node


var solution_pattern = []
var switches = [] # The order matters in order to line up with solution pattern.
var connected_object = null

# Returns true if the solution_pattern matches the state of the switches.
# Otherwise, returns false.
func is_solved():
	for x in len(solution_pattern):
		if switches[x].on && solution_pattern[x] == false:
			print("Not yet solved...switch is on, yet pattern says 'false' for switch no. "+str(x))
			return false
		if not switches[x].on && solution_pattern[x] == true:
			print("Not yet solved...switch is on, yet pattern says 'false' for switch no. "+str(x))
			return false
	return true


# Called when the node enters the scene tree for the first time.
func _ready():
	solution_pattern = []
	switches = []
	pass # Replace with function body.

func run_interaction(param):
	if (is_solved()):
		connected_object.run_interaction(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
