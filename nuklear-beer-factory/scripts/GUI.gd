extends Control


export(NodePath) var _camera

var _is_in_basement = false


func _on_toggle_cam_view():
	if _camera:
		var _animation_player: AnimationPlayer = get_node(_camera).get_child(0)
		if not _is_in_basement:
			_animation_player.play("Toggle_Cam")
			_is_in_basement = true
		else:
			_animation_player.play_backwards("Toggle_Cam")
			_is_in_basement = false
