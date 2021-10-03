extends Control


signal room_switched(room_type) 


onready var map: TextureRect = get_node("Map")


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("toggle_map_visible"):
		toggle_map_visible()


func toggle_map_visible() -> void:
	map.visible = !map.visible


func _on_Map_Close_Button_button_down():
	toggle_map_visible()


func _on_Map_Button_button_down():
	toggle_map_visible()


func _on_A_Button_button_down():
	emit_signal("room_switched", Room.RoomType.ROOM_A)


func _on_B_Button_button_down():
	emit_signal("room_switched", Room.RoomType.ROOM_B)

func _on_C_Button_button_down():
	emit_signal("room_switched", Room.RoomType.ROOM_C)

