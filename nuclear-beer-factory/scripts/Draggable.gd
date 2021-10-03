extends RigidBody2D


export(float) var _force: float = 100

var _is_mouse_entered: bool = false
var _dragging_pos: Vector2 = Vector2.ZERO
var _is_dragging: bool = false


var _motion: Vector2 = Vector2.ZERO


#func _process(delta: float) -> void:
#
#	if _is_dragging:
#		global_transform.origin = get_global_mouse_position()


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed() && _is_mouse_entered:
			_is_dragging = true
#			mode = RigidBody2D.MODE_KINEMATIC
			_dragging_pos = event.position
		else:
			_is_dragging = false
#			mode = RigidBody2D.MODE_RIGID
			
	elif event is InputEventMouseMotion && _is_dragging:
		_motion = event.relative * get_physics_process_delta_time() * _force
		apply_central_impulse(_motion)


func _on_Draggable_Rigidbody_Box_mouse_entered():
	_is_mouse_entered = true


func _on_Draggable_Rigidbody_Box_mouse_exited():
	_is_mouse_entered = false
