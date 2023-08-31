extends Collider

@export var speed : float = 100
	
func _physics_process(delta):
	var velocity = Vector2(0, 0)
	
	#Attempted Movement
	velocity = input()*speed #make sure to normalize or else diagonal movement will be faster than cardinal
	position += velocity * delta
	
	#Collision Check
	if colliding():
		position -= velocity * delta

func input() -> Vector2:
	return Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		(Input.get_action_strength("down") - Input.get_action_strength("up"))/2 #in isometric the height is half the width(for videogames)
		).normalized()
