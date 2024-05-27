"""
This node handles the beginning of the maze sequence.
"""

extends Area2D

signal start_maze_sequence

export (bool) var mode_ending = false

var player_tripped = false

# Called when the node enters the scene tree for the first time.
func _ready():
	player_tripped = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartMazeSequenceTrigger_body_entered(body):
	print("Something entered...")
	if body.has_method("start_maze_sequence"):
		if player_tripped == false:
			player_tripped = true
			if mode_ending:
				if body.has_method("end_maze_sequence"):
					body.end_maze_sequence()
			else: 
				print("...and it has the start maze sequence!")
				body.start_maze_sequence()
				$ScreamFortressTheme.play()
				emit_signal("start_maze_sequence")
			


func _on_ScreamFortressTheme_finished():
	$ScreamFortressTheme.stop()
	$RightBehindYouTheme.play()


func _on_RightBehindYouTheme_finished():
	$ScreamFortressTheme.stop()
	$RightBehindYouTheme.stop()
