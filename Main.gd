extends Node

onready var bullet_manager = $BulletManager
onready var player = $Player


# Called when the node enters the scene tree for the first time.
func _ready():
	$GhostSpawner.target = player
	# $Ghost.target = player
	$Puzzle4.connect("start_spawning_ghosts",self,"_on_Start_Spawning_Ghosts")
	player.gun.connect("player_fired_bullet", bullet_manager, "handle_bullet_spawned")
	$Ghost.connect("ghost_died",self,"_on_Ghost_Died")
	
	
	$Switch.connected_object = $Door
	$Door.d_hinge = $Hinge

	
func _on_Start_Spawning_Ghosts():
	print("Soon we wills pawn ghosts!! add code here in main script in func _on_SpawnTimer_timeout()...")
	$GhostSpawner.activated = true
	$GhostSpawner/SpawnTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Ghost_Died():
	print("AAAH A GHOST DIIIED")


