extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var ghost = preload("res://Ghost.tscn")
var target = null
var activated = false
var base_wait_time = 2
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_SpawnTimer_timeout():
	var loc = randi()%4
	if loc == 0:
		loc = $SpawnLocation1
		$SpawnLocation1/SpawnSound.play()
	elif loc == 1:
		loc = $SpawnLocation2
		$SpawnLocation2/SpawnSound.play()
	elif loc == 2:
		loc = $SpawnLocation3
		$SpawnLocation3/SpawnSound.play()
	elif loc == 3:
		loc = $SpawnLocation4
		$SpawnLocation4/SpawnSound.play()
	
	var ghost_inst = ghost.instance()
	ghost_inst.target = target
	ghost_inst.position = loc.position
	
	get_parent().add_child(ghost_inst)
	
	#Spawn a ghost once every 5-15 seconds
	$SpawnTimer.set_wait_time(base_wait_time+(randi()%9))
	print("Ghost spawn timer timed out in GhostSpawner.gd.")
	print("Spawning from: "+str(loc))
	pass # Replace with function body.
