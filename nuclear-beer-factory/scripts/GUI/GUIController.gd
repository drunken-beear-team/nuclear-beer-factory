extends Node2D


onready var root_node = get_tree().get_current_scene()
onready var gui = root_node.get_node("CanvasLayer/GUI")
onready var tab_menu = gui.get_node("TabMenu")
onready var tab_menu_btn = gui.get_node("Tab_Button")


func _ready() -> void:
	tab_menu.visible = false
	tab_menu_btn.visible = true


func toggle_tab_menu_visible() -> void:
	tab_menu.visible = !tab_menu.visible
	tab_menu_btn.visible = !tab_menu_btn.visible


func _on_Tab_Button_button_down():
	toggle_tab_menu_visible()

func _on_MapClose_Button_button_down():
	toggle_tab_menu_visible()
