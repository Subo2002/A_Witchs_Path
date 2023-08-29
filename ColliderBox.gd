extends Area2D

const volume : Vector3 = Vector3(-1, -1, 1)
@onready var pos = screen_to_iso(Vector3(position.x, position.y, z_index*16))
@onready var max_pos = pos + 16*volume


var occupied : bool = false
var occupying_body : Node2D = null
var occupying_position : Vector3
var occupying_volume : Vector3
var occupying_max : Vector3

func _on_body_entered(body):
	occupying_body = body
	occupied = true
	occupying_volume = body.volume
	
func _on_body_exited(_body):
	occupied = false
	occupying_body = null
	
func _physics_process(_delta):
	if occupied:
		occupying_position = screen_to_iso(Vector3(occupying_body.get_position().x, occupying_body.get_position().y, occupying_body.z_index*16))
		occupying_max = occupying_position + occupying_volume*16
		if collision():
			print("collision!!")
	
func collision() -> bool:
	if (lines_intersect(pos.x, max_pos.x, occupying_position.x, occupying_max.x) &&
		lines_intersect(pos.y, max_pos.y, occupying_position.y, occupying_max.y) 
		):  #need to add the Z-Check here, atm sign issue, too lazy to fix
		return true
	return false

func lines_intersect(one_min, one_max, two_min, two_max) -> bool:
	if (one_min >= two_min && two_min >= one_max ||
		two_min >= one_min && one_min >= two_max):
		return true
	return false
	
func screen_to_iso(vector : Vector3) -> Vector3:
	var iso_transform = Transform3D()
	var scaler = 1/(2*sqrt(2))
	iso_transform.basis = Basis(Vector3(1, -1, 0)*scaler, Vector3(1, 1, 0)*scaler, Vector3(0, 0, 1))
	return iso_transform*vector
	
	
	
