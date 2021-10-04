extends "res://scripts/Objects/Draggable.gd"


export(int) var type = 0


enum EatableType {
	NONE,
	FUEL,
	SANK,
	BOTTLE,
}


func eat() -> int:
	$AnimationPlayer.play("Eatable_Disappear")
	self.mode = RigidBody2D.MODE_KINEMATIC
	return type
