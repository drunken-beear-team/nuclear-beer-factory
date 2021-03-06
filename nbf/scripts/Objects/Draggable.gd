extends RigidBody2D


export(float) var _force: float = 50


var _is_mouse_entered: bool = false
var _dragging_pos: Vector2 = Vector2.ZERO
var _is_dragging: bool = false



func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.is_pressed() && _is_mouse_entered:
			_is_dragging = true
			_dragging_pos = event.position
		else:
			_is_dragging = false
	elif event is InputEventMouseMotion && _is_dragging:
		var motion = event.relative * get_physics_process_delta_time() * _force
		apply_central_impulse(motion)


func _on_Draggable_mouse_entered():
	_is_mouse_entered = true


func _on_Draggable_mouse_exited():
	_is_mouse_entered = false
