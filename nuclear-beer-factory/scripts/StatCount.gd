extends Label


export(String) var template_string = "%s"


func update_val(new_val: int) -> void:
	text = template_string % new_val
