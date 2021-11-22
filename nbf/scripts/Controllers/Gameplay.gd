extends Node2D


export(PackedScene) var _bottle_prefab
export(PackedScene) var _fuel_prefab
export(PackedScene) var _sank_prefab


onready var _objs = get_node("Objects")
onready var _bottles = _objs.get_node("Bottles")
onready var _fuels = _objs.get_node("Fuels")
onready var _sanks = _objs.get_node("Sanks")

onready var _fuel_spawner = $FuelSpawner
onready var _sank_spawner = $SankSpawner


func _spawn_env_item(pkd_scene: PackedScene, parent: Node, position: Vector2) -> void:
	if pkd_scene == null:
		print("[WARN]: Trying to spawn null object from `Gameplay`")
		return 
	var inst = pkd_scene.instance()
	inst.global_position = position
	parent.add_child(inst)


func spawn_fuel() -> void:
	_spawn_env_item(_fuel_prefab, _fuels, _fuel_spawner.global_position)
func spawn_sank() -> void:
	_spawn_env_item(_sank_prefab, _sanks, _sank_spawner.global_position)


func _process(delta: float) -> void:
	_handle_player_input()


func _handle_player_input() -> void:
	if Input.is_action_pressed("quit_game"):
		get_tree().quit(0)
	if Input.is_action_just_pressed("spawn_bottle"):
		_spawn_env_item(_bottle_prefab, _bottles, get_global_mouse_position())
	if Input.is_action_just_pressed("spawn_fuel"):
		_spawn_env_item(_fuel_prefab, _fuels, get_global_mouse_position())
	if Input.is_action_just_pressed("reload_scene"):
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("toggle_tab_menu_visible"):
		$GUIController.toggle_tab_menu_visible()


func lose() -> void:
	get_tree().quit(1)


func _on_ExplotionAnimationPlayer_animation_finished(anim_name):
	lose()
