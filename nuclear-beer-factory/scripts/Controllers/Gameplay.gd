extends Node2D


export(PackedScene) var _bottle_prefab
export(PackedScene) var _fuel_prefab


onready var _objs = get_node("Objects")
onready var _bottles = _objs.get_node("Bottles")
onready var _fuels = _objs.get_node("Fuels")
onready var _sanks = _objs.get_node("Sanks")


func _spawn_env_item(pkd_scene: PackedScene, parent: Node) -> void:
	if pkd_scene == null:
		print("[WARN]: Trying to spawn null object from `Gameplay`")
		return 
	var inst = pkd_scene.instance()
	inst.global_position = get_global_mouse_position()
	parent.add_child(inst)


func _process(delta: float) -> void:
	_handle_player_input()


func _handle_player_input() -> void:
	if Input.is_action_pressed("quit_game"):
		get_tree().quit(0)
	if Input.is_action_just_pressed("spawn_bottle"):
		_spawn_env_item(_bottle_prefab, _bottles)
	if Input.is_action_just_pressed("spawn_fuel"):
		_spawn_env_item(_fuel_prefab, _fuels)
	if Input.is_action_just_pressed("reload_scene"):
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("toggle_tab_menu_visible"):
		$GUIController.toggle_tab_menu_visible()


func lose() -> void:
	if Values.GAME_MODE == "GOD":
		return
	else:
		get_tree().quit(1)
