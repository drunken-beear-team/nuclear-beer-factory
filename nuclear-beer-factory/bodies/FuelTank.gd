extends Area2D


func _on_Fuel_tank_body_entered(body: RigidBody2D):
	var anim_player: AnimationPlayer = body.get_node("AnimationPlayer")
	anim_player.play("Dissapear")
	body.mode = RigidBody2D.MODE_KINEMATIC
