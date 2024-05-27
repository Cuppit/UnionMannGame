extends KinematicBody2D

#onready var bullet_manager = $BulletManager
onready var gun = $Gun



signal player_fired_bullet(bullet)

# Called when the node enters the scene tree for the first time.
func _ready():
	gun.visible = false
	#gun.connect("gun_fired_bullet", bullet_manager, "handle_bullet_spawned")
	pass # Replace with function body.

export (int) var hp = 3

# Character base speed (in pixels per second?)
export (int) var base_speed = 400

export (int) var speed = 400
export (int) var gun_spd_mod = 0.5 # How move speed is affected while gun equipped

var dead = false

# Current effective character speed.
var velocity = Vector2()

var equipped_weapon = null



#This is the object which, when this character executes it's "interact" function,
#will run it's interaction code.   
var interactee = null

func reset_speed(): #resets player speed based on factors
	var final_speed = base_speed
	
	if equipped_weapon == gun:
		final_speed *= gun_spd_mod
	
	speed = final_speed
	
	

func character_dies():
	velocity = Vector2()
	set_collision_layer_bit(1, false)
	set_collision_layer_bit(0, false)
	set_collision_mask_bit(1, false)
	set_collision_mask_bit(0, false)
	dead = true
	$DeathScream.play()
	$AnimationPlayer.play("fade_to_red")

# Code for running interaction with an object
func interact():
	if interactee != null:
		interactee.run_interaction(null)


func hit_by_ghost():
	print("Player was hit by ghost!")
	$AnimationPlayer.play("smacked_by_ghost")
	hp -= 1
	if hp <= 0:
		character_dies()

# Code for wielding / holstering gun
func wield_gun():
	if (equipped_weapon != gun):
		equipped_weapon = gun
		gun.visible = true
		reset_speed()
		$GunCock.play()
		print("Gun equipped!")
	else:
		equipped_weapon = null
		gun.visible = false
		reset_speed()
		$Holster.play()
		print("Gun holstered.")

# This function should only be called by the scene "StartMazeSequenceTrigger.tscn"
# in response to the player character moving into the area.
func start_maze_sequence():
	$AnimationPlayer.play("zoom_maze_enter")
	base_speed = 800
	reset_speed()

func end_maze_sequence():
	$AnimationPlayer.play("zoom_maze_exit")
	base_speed = 300
	reset_speed()

func get_input():
	look_at(get_global_mouse_position())
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	
	if Input.is_action_just_pressed("click"):
		if (equipped_weapon == gun):
			var bullet_inst = gun.fire()
			emit_signal("player_fired_bullet", bullet_inst)
		pass
	
	if Input.is_action_just_pressed("wield_gun"):
		wield_gun()
	
	if Input.is_action_just_pressed("interact"):
		interact()
		
	if Input.is_action_pressed("zoom_in"):
		$Camera2D.zoom.x += 0.1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if not dead:
		get_input()
	velocity = move_and_slide(velocity)
