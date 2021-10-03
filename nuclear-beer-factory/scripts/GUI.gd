extends Control

enum Scene { 
	SCENE_A, 
	SCENE_B, 
	SCENE_C 
}

signal scene_switched(scene) 


onready var map: TextureRect = get_node("Map")


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("toggle_map_visible"):
		toggle_map_visible()


func toggle_map_visible() -> void:
	map.visible = !map.visible


func _on_Map_Button_button_down():
	toggle_map_visible()


func _on_A_Button_button_down():
	emit_signal("scene_switched", Scene.SCENE_A)


func _on_B_Button_button_down():
	emit_signal("scene_switched", Scene.SCENE_B)

func _on_C_Button_button_down():
	emit_signal("scene_switched", Scene.SCENE_C)
