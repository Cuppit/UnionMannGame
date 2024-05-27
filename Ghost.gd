extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 300
var hp = 3
var velocity = Vector2()

signal ghost_died

# The target the ghost attempts to kill.
var target = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func ghost_dies():
	emit_signal("ghost_died")
	set_collision_layer_bit(1, false)
	set_collision_layer_bit(0, false)
	set_collision_mask_bit(1, false)
	set_collision_mask_bit(0, false)
	$DeathTimer.start()
	$DeathSound.play()
	$Disappear.play("disappear")

func hit():
	hp -= 1
	$HitSound.play()
	if hp <= 0:
		ghost_dies()

func get_movement():
	if target != null:
		look_at(target.position)
		velocity = Vector2(speed, 0).rotated(rotation)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_movement()
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.has_method("hit_by_ghost"):
			$EvilLaugh.play()
			ghost_dies()
			collision.collider.hit_by_ghost()
	#get_input()

"""
func get_input():
	velocity = Vector2()
	look_at(get_global_mouse_position())
	#velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

"""



func _on_DeathTimer_timeout():
	queue_free()


func _on_EvilDrone_finished():
	$EvilDrone.play()
	pass # Replace with function body.
