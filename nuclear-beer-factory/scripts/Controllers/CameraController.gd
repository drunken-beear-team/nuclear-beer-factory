extends Node2D

# ToDo: make be RoomType actually
export(int) var _starting_scene_idx = 0


var _cur_cam: Camera2D
var _cur_cam_id: int


func _ready() -> void:
	_cur_cam = get_child(_starting_scene_idx)
	_cur_cam.current = true


func switch_room(room_type: int) -> void:
	if _cur_cam_id == room_type:
		return
	print("[INFO]: Switching to room with id[%s]" % room_type)
	_cur_cam.current = false
	_cur_cam = get_child(room_type)
	_cur_cam_id = room_type
	_cur_cam.current = true


func _on_A_Button_button_down():
	switch_room(RoomType.ROOM_A)


func _on_B_Button_button_down():
	switch_room(RoomType.ROOM_B)


func _on_C_Button_button_down():
	switch_room(RoomType.ROOM_C)
