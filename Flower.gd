extends Node2D

#Should connect a Node that stores the flowers characteristics (non physical)
@export var PathGlowBorderLayer : NodePath 
@onready var GlowBorderLayer : Sprite2D = get_node(PathGlowBorderLayer)

var mouse_hovering : bool = false

func _on_mouse_entered():
	mouse_hovering = true
	GlowBorderLayer.visible = true

func _on_mouse_exited():
	mouse_hovering = false
	GlowBorderLayer.visible = false
	
func _input(_event):
	if mouse_hovering && Input.is_action_pressed("left click"):
		click()
	
#should check if item is being used, e.g. "that shovel thing" and change the sprite accordingly, potentially opening a UI
#also needs to send info of what is collected to the player so can add to inventory
func click():
	print("clicked")





