extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var speed = 1600

#var hit_sound = $HitSound

#var direction := Vector2.ZERO

func set_direction(rot: float):
		self.rotation = rot
		print("Bullet direction angle to: "+str(rot))
		velocity = Vector2(speed, 0).rotated(rotation)
		
	
var velocity = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	#velocity = Vector2(speed, 0).rotated(rotation)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if direction != Vector2.ZERO:
	#var velocity = direction * speed
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.has_method("hit"):
			collision.collider.hit()
		
		print("Attempting to play bullet hit sound...")
		
		queue_free()
