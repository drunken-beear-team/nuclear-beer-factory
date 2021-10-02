extends CheckBox


export(Array, NodePath) var _sliders = []


func _on_CheckBox_toggled(button_pressed):
	for node_path in _sliders:
		var slider = get_node(node_path)
		print(slider.name)
