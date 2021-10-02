extends Area2D


func _on_Area2D_body_entered(body):
	var anim_player: AnimationPlayer = body.get_node("AnimationPlayer")
	anim_player.play("Dissapear")
	body.mode = RigidBody2D.MODE_KINEMATIC
