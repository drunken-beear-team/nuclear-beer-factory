extends Area2D


signal eated(eatable_type)


func _on_Eater_body_entered(body):
	print(body)
	if body.has_method("eat"):
		var eatable_type = body.eat()
		emit_signal("eated", eatable_type)
