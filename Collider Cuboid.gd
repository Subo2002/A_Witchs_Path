class_name ColliderCuboid
extends StaticBody2D
@export var path_collider_box : NodePath

func get_collider_box():
	return get_node(path_collider_box) as collider_box
	
	
