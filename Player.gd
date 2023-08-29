extends CharacterBody2D

@export var speed : float = 100
@export var gravity : float = 980
@export var volume : Vector3 = Vector3(-1, -1, 2)


func _physics_process(delta):
	
	#Input Direction
	var input_direction : Vector2 = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		(Input.get_action_strength("down") - Input.get_action_strength("up"))/2 #in isometric the height is half the width(for videogames)
	)
	velocity = input_direction.normalized()*speed #make sure to normalize or else diagonal movement will be faster than cardinal
	#delta is the time between the last frame and this one, and approximates how much time
	var collider_information = move_and_collide(velocity*delta)
	if collider_information:
		var collider_cuboid = collider_information.get_collider() as ColliderCuboid
		var collider = collider_cuboid.get_collider_box() as collider_box
		if collider.collision():
			position -= velocity * delta
		else:
			position += velocity * delta
		
		


	
