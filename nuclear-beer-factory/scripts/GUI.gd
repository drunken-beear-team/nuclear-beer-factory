extends CanvasLayer


signal room_switched(room_type) 


onready var map: Control = get_node("Map")
onready var map_btn: TextureButton = get_node("Map Button")
onready var stats_container: Container = get_node("StatsContainer")


func _ready() -> void:
	map.visible = false
	map_btn.visible = true


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("toggle_map_visible"):
		toggle_map_visible()


func toggle_map_visible() -> void:
	map.visible = !map.visible
	map_btn.visible = !map_btn.visible


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


func _on_stat_changed(new_val: int, stat_idx: int) -> void:
	stats_container.get_child(stat_idx).update_val(new_val)
