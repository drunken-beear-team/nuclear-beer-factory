extends "res://scripts/Objects/Draggable.gd"


export(int) var type = 0


func eat() -> int:
	$AnimationPlayer.play("Eatable_Disappear")
	self.mode = RigidBody2D.MODE_KINEMATIC
	return type
