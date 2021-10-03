extends Node2D


export(int) var _starting_scene_idx: int = 0


var _current_camera: Camera2D


# TODO: check all cameras not a current
func _ready() -> void:
	_current_camera = get_child(_starting_scene_idx)
	_current_camera.current = true


func _switch_room(room_type: int) -> void:
	print("[INFO]: Switching to room with id[%s]" % room_type)
	_current_camera.current = false
	_current_camera = get_child(room_type)
	_current_camera.current = true


func _on_GUI_room_switched(room_type: int) -> void:
	_switch_room(room_type)
