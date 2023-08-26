extends CharacterBody2D

@export var speed : float = 100
@export var gravity:float = 980

func _physics_process(delta):
	#Input Direction
	var input_direction : Vector2 = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		(Input.get_action_strength("down") - Input.get_action_strength("up"))/2
	)
	velocity = input_direction.normalized()*speed
	position += velocity * delta
	
