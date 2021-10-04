extends Node2D


signal room_changed(room_idx)


export(Room.RoomType) var _starting_scene_idx = 0
export(Array) var _bg_arr;


var _cur_cam: Camera2D
var _cur_cam_id: int


# TODO: check all cameras not a current
func _ready() -> void:
	_cur_cam = get_child(_starting_scene_idx)
	_cur_cam.current = true


func _switch_room(room_type: int) -> void:
	if _cur_cam_id == room_type:
		return
	print("[INFO]: Switching to room with id[%s]" % room_type)
	_cur_cam.current = false
	_cur_cam = get_child(room_type)
	_cur_cam_id = room_type
	_cur_cam.current = true
	emit_signal("room_changed", room_type)


func _on_GUI_room_switched(room_type: int) -> void:
	_switch_room(room_type)
