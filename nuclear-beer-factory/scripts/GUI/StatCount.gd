extends Label


export(String) var _template_string = "Template string: %s"


func update_val(new_val: int) -> void:
	text = _template_string % new_val


func _on_StatController_stat_changed(stat_idx, new_val):
#	print("DEBUG: Get update call about stat [%s] with new val [%s]" % [stat_idx, new_val])
	if stat_idx == get_index():
		self.update_val(new_val)
