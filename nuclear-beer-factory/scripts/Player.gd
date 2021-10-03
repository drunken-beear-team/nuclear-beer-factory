extends Node2D


export(PackedScene) var _bottle_prefab
export(PackedScene) var _fuel_prefab


onready var _environment: Node2D = get_node("Environment")


func _spawn_env_item(pkd_scene: PackedScene, parent: Node) -> void:
	var inst: Node2D = pkd_scene.instance()
	var viewport: Viewport = get_viewport()
	inst.global_position = get_global_mouse_position()
	parent.add_child(inst)	


func _process(delta: float) -> void:
	_handle_player_input()


func _handle_player_input() -> void:
	if Input.is_action_pressed("quit_game"):
		get_tree().quit(0)
	if Input.is_action_just_pressed("spawn_bottle"):
		_spawn_env_item(_bottle_prefab, get_node("../Environment/Bottles"))
	if Input.is_action_just_pressed("spawn_fuel"):
		_spawn_env_item(_fuel_prefab, get_node("../Environment/Fuels"))
