extends Area2D

@export var speed : float = 100
@export var Gravity : float = 980
@export var volume : Vector3 = Vector3(-1, -1, 2)

#FINDING COLLIDERS
var colliding_bodies : Array = []
var collider

func _on_area_entered(area):
	colliding_bodies.append(area as collider_box)
	print(area.position)

func _on_area_exited(area):
	colliding_bodies.erase(area as collider_box)




func _physics_process(delta):
	var velocity = Vector2(0, 0)
	#Input Direction
	var input_direction : Vector2 = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		(Input.get_action_strength("down") - Input.get_action_strength("up"))/2 #in isometric the height is half the width(for videogames)
	)
	velocity = input_direction.normalized()*speed #make sure to normalize or else diagonal movement will be faster than cardinal
	#delta is the time between the last frame and this one, and approximates how much time
	var Position = position + velocity*delta
	var okay = true
	for body in colliding_bodies:
		var body_min = body.pos
		var body_max = body.max_pos
		var pos = screen_to_iso(Vector3(Position.x, Position.y, z_index))
		var max = pos + volume
		if (body_max.x < pos.x &&
			max.x < body_min.x &&
			body_max.y < pos.y &&
			max.y < body_min.y ): #need to add the Z-Check here, atm sign issue, too lazy to fix
			okay = false
			
	if okay:
		position = Position
	
#Should move in to a isometric math class maybe (same function copied in collider_box, could alternativley compute it here but not very OOP)
func screen_to_iso(vector : Vector3) -> Vector3:
	var iso_transform = Transform3D()
	iso_transform.basis = Basis(Vector3(1, -1, 0)*(1/32.0), Vector3(2, 2, 0)*(1/32.0), Vector3(0, 0, 1))
	return iso_transform*vector
		
		



