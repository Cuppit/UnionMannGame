extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func hit():
	print("maze hit, attempting sound")
	var choice = randi()%5
	if choice == 0:
		$BulletHit.play()
	elif choice == 1:
		$BulletHit2.play()
	elif choice == 2:
		$BulletHit3.play()
	elif choice == 3:
		$BulletHit4.play()
	elif choice == 4:
		$BulletHit5.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
