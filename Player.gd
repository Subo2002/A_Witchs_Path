extends CharacterBody2D

@export var speed : float = 100
@export var gravity:float = 980


func _physics_process(delta):
	#Input Direction
	var input_direction : Vector2 = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		(Input.get_action_strength("down") - Input.get_action_strength("up"))/2 #in isometric the height is half the width(for videogames)
	)
	velocity = input_direction.normalized()*speed #make sure to normalize or else diagonal movement will be faster than cardinal
	#delta is the time between the last frame and this one, and approximates how much time
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:  #collision_info isn't a boolean so this doesn't make sense in that sense, what it does is check if collision info is a null object, i.e. if you actually collided with anything
		print(collision_info.get_position())

