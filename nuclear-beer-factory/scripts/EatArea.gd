extends Area2D


signal stat_add()


func _on_EatArea_body_entered(body):
	var anim_player: AnimationPlayer = body.get_node("AnimationPlayer")
	if anim_player != null:
		anim_player.play("Disappear")
		body.mode = RigidBody2D.MODE_KINEMATIC
		emit_signal("stat_add")
#	else:
#		print("[WANG]: %s entered in %s without `AnimationPlayer`" % body, self)
