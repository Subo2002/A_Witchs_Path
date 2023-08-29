class_name collider_box
extends Area2D


const volume : Vector3 = Vector3(-1, -1, 1)

var max_pos
var pos

func _ready():
	pos = screen_to_iso(Vector3(position.x, position.y, z_index))
	max_pos = pos + volume
	
func screen_to_iso(vector : Vector3) -> Vector3:
	var iso_transform = Transform3D()
	iso_transform.basis = Basis(Vector3(2, 1, 0)*(1/sqrt(5)), Vector3(2, -1, 0)*(1/sqrt(5)), Vector3(0, 0, 1))
	return iso_transform*vector
	
	
	
