extends Area2D

#signal gun_fired_bullet(bullet)


onready var muzzle = $Muzzle
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var bullet = load("res://Bullet.tscn")
var cooldown = 0.75 # amount of time in seconds that needs to pass in between shots.
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


func fire():
	# Spawn bullet at location of muzzle with velocity towards mouse pointer
	print("FIRE!")
	
	if $Cooldown.is_stopped():
		$Cooldown.start(cooldown)
		var bullet_inst = bullet.instance()
		# bullet_inst.set_name("Bullet")
		bullet_inst.global_position = muzzle.global_position
		print("Bullet spawned at: "+str(bullet_inst.position)+", global position: "+str(bullet_inst.global_position))
	
		var bull_rotation = get_parent().rotation 
		
		var target = get_global_mouse_position()
		var direction_to_mouse = target - muzzle.global_position.direction_to(target).normalized()
		bullet_inst.set_direction(bull_rotation)
		
		
		get_parent().get_parent().add_child(bullet_inst) # Really, really nasty way of getting bullet
		print("playing gunshot sound!")
		$Gunshot.play()
		# handled by "main".  We'll go with it for now.
		#emit_signal("gun_fired_bullet", bullet_inst)
		return bullet_inst

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Cooldown_timeout():
	$Cooldown.stop()
	pass # Replace with function body.


func _on_Gunshot_finished():

	$Gunshot.stop()
	pass # Replace with function body.
