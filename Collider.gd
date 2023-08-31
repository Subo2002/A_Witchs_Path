class_name Collider
extends Area2D

@export var volume : Vector3
@export var offset : Vector3
var colliding_bodies : Array = []

func _on_area_entered(area):
	colliding_bodies.append(area as Collider)

func _on_area_exited(area):
	colliding_bodies.erase(area as Collider)

func position3D(): #Should only do this if position moves, maybe static variable check?
	return Isometric.screen_to_iso*(Vector3(position.x, position.y, z_index) + offset)

func collision(collider : Collider) -> bool:
	var Position3D = position3D()
	var opposite = Position3D + volume
	var collider_position3D = collider.position3D()
	var collider_opposite = collider_position3D + collider.volume
	var X = collider_opposite.x < Position3D.x && opposite.x < collider_position3D.x
	var Y = collider_opposite.y < Position3D.y && opposite.y < collider_position3D.y
	var Z = collider_position3D.z < opposite.z && Position3D.z < collider_opposite.z
	return  X && Y && Z

func colliding() -> bool:
	var Colliding = false
	for body in colliding_bodies:
		if (collision(body)):
			Colliding = true
	return Colliding
