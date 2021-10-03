extends Node2D


export(PackedScene) var _bottle_prefab
export(PackedScene) var _fuel_prefab


onready var _gameplay: Node2D = get_tree().get_current_scene()
onready var _env: Node2D = _gameplay.get_node("Environment")
onready var _bottles: Node2D = _env.get_node("Bottles")
onready var _fuels: Node2D = _env.get_node("Fuels")


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
		_spawn_env_item(_bottle_prefab, _bottles)
	if Input.is_action_just_pressed("spawn_fuel"):
		_spawn_env_item(_fuel_prefab, _fuels)
