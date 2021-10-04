extends Area2D


export(int) var valid_eatable_type = 0

signal eated(eatable_type)


func _on_Eater_body_entered(body):
	if body.has_method("eat") && (body.type == valid_eatable_type or body.type == EatableType.COUNT):
		var eatable_type = body.eat()
		emit_signal("eated", eatable_type)
